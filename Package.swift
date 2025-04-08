// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ios-hapticshelper",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "HapticsHelper",
            targets: ["HapticsHelper"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HapticsHelper",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
