// swift-tools-version:5.6
// MARK: - Package Description
import PackageDescription

// ⚠️ ensure this flag is 'false' before commiting
let localDependencies = false


// MARK: - Package Configuration
let package = Package(
    name: "darwell-haptickit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DarwellHapticKit",
            targets: ["DarwellHapticKit"]),
    ],
    dependencies: localDependencies ? Package.localDeps : Package.remoteDeps,
    targets: [
        .target(
            name: "DarwellHapticKit",
            dependencies: Package.targetDependencies,
            path: "Sources",
            resources: [
            ],
            linkerSettings: [
                .linkedFramework("GalenitCoreUtils")
            ]
        ),
    ]
)

// MARK: -- Dependencies
extension Package {
    static var remoteDeps: [Package.Dependency] {
        [
            .package(url: "git@github.com:Galen-IT/coreutils-ios.git", from: "1.0.2"),
        ]
    }

    static var localDeps: [Package.Dependency] {
        [
            .package(path: "../coreutils-ios"),
        ]
    }

    static var targetDependencies: [Target.Dependency] {
        [
            .product(name: "GalenitCoreUtils", package: "coreutils-ios"),
        ]
    }
}
