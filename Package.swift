// swift-tools-version:5.6
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
