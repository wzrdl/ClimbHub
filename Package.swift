// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ClimbHub",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "ClimbHub",
            targets: ["ClimbHub"]),
    ],
    dependencies: [
        // Add dependencies here when needed
    ],
    targets: [
        .target(
            name: "ClimbHub",
            dependencies: []),
        .testTarget(
            name: "ClimbHubTests",
            dependencies: ["ClimbHub"]),
    ]
) 