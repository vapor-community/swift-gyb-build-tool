// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "swift-gyb-build-tool",
    products: [
        .plugin(name: "swift-gyb-build-tool", targets: ["swift-gyb-build-tool"]),
        .executable(name: "GybToolExample", targets: ["GybToolExample"]),
    ],
    dependencies: [
    ],
    targets: [
        .plugin(name: "swift-gyb-build-tool", capability: .buildTool(), dependencies: [.target(name: "gyb-swift")]),
        .binaryTarget(name: "gyb-swift", path: "Artifacts/gyb-swift.artifactbundle"),
        .executableTarget(name: "GybToolExample", dependencies: [], plugins: [.plugin(name: "swift-gyb-build-tool")]),
    ]
)
