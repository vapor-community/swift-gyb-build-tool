# swift-gyb-build-tool

Makes Swift's [`gyb` code generation tool](https://github.com/apple/swift/blob/main/utils/gyb.py) available as a SwiftPM build tool plugin.

To use, first add the package as a dependency:

```swift
    dependencies: [
        ...
        .package(url: "https://github.com/vapor-community/swift-gyb-build-tool.git", from: "0.0.1"),
    ]
```

Then add the plugin to the target(s) which contain `.gyb` files:

```swift
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                ...
            ],
            plugins: [
                .plugin(name: "swift-gyb-build-tool", package: "swift-gyb-build-tool"),
            ]
        )
    ]
```
