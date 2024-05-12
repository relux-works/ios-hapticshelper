// swift-tools-version:5.6
// MARK: - Package Description
import PackageDescription


// MARK: - Package Configuration
let package = Package(
    name: "ios-hapticshelper",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "HapticsHelper",
            targets: ["HapticsHelper"]
        ),
    ],
    dependencies: Package.remoteDeps,
    targets: [
        .target(
            name: "HapticsHelper",
            dependencies: Package.targetDependencies,
            path: "Sources"
        ),
    ]
)

// MARK: -- Dependencies
extension Package {
    static var remoteDeps: [Package.Dependency] {
        [
            
        ]
    }
    
    static var targetDependencies: [Target.Dependency] {
        [
           
        ]
    }
}
