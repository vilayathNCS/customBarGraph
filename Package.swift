// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CustomBarChart",
    platforms: [
        .iOS(.v16),  // Since we're using Charts framework
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "CustomBarChart",
            targets: ["CustomBarChart"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CustomBarChart",
            dependencies: []),
        .testTarget(
            name: "CustomBarChartTests",
            dependencies: ["CustomBarChart"]),
    ]
)
