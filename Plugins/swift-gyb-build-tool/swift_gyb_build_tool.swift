import PackagePlugin

@main
struct GybBuildPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let target = target as? SwiftSourceModuleTarget else { return [] }
        
        return try target.sourceFiles(withSuffix: ".gyb")
        .map { ($0.path, context.pluginWorkDirectory.appending($0.path.withExtension("swift").lastComponent)) }
        .map { sourcePath, destPath in
            .buildCommand(
                displayName: "Generating \(destPath.lastComponent) from \(sourcePath.lastComponent)",
                executable: try context.tool(named: "gyb-swift").path,
                arguments: target.compilationConditions.flatMap { ["-D", "\($0)=1"] } + [
                    "--line-directive", #"#sourceLocation(file: "%(file)s", line: %(line)d)"#,
                    "-o", destPath,
                    sourcePath,
                ],
                inputFiles: [sourcePath],
                outputFiles: [destPath]
            )
        }
    }
}

extension PackagePlugin.Path {
    /// Return a new ``PackagePlugin/Path`` formed by replacing the existing extension (if any)
    /// with the one provided.
    ///
    /// If, after removing the existing extension, the path already has the new extension, no
    /// further changes are made. This prevents generating names with duplicated extensions.
    ///
    /// - Parameters:
    ///   - newExtension: The new extension for the path.
    /// - Returns: The resulting path.
    ///
    /// Example:
    ///
    ///     let path = .init("/foo/bar.tar.gz")
    ///
    ///     "/foo.pkg.tar.gz".settingExtension(to: "bar")    // "/foo.pkg.tar.bar"
    ///     "/foo.pkg.tar.gz".settingExtension(to: "tar")    // "/foo.pkg.tar"
    ///     "/foo.pkg.tar.gz".settingExtension(to: "gz")     // "/foo.pkg.tar.gz"
    ///     "/foo.pkg.tar.gz".settingExtension(to: "tar.gz") // "/foo.pkg.tar.gz"
    ///     "/foo.pkg.tar.gz".settingExtension(to: "tar.xz") // "/foo.pkg.tar.tar.xz"
    ///
    func withExtension(_ newExtension: String) -> Self {
        self.removingLastComponent()
            .appending(self.stem + (self.stem.hasSuffix(".\(newExtension)") ? "" : ".\(newExtension)"))
    }
}
