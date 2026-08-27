// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TimelineTableViewCell",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "TimelineTableViewCell",
            targets: ["TimelineTableViewCell"]),
    ],
    dependencies: [
        // Add dependencies here if needed
    ],
    targets: [
        .target(
            name: "TimelineTableViewCell",
            dependencies: [],
            path: "TimelineTableViewCell",
            resources: [
                .process("TimelineTableViewCell.xib") // Adjust the filename if it's a .nib
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
