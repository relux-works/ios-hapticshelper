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
            
        ]
    }

    static var localDeps: [Package.Dependency] {
        [
            
        ]
    }

    static var targetDependencies: [Target.Dependency] {
        [
           
        ]
    }
}
