// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Gravatar",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .visionOS(.v1),
        .watchOS(.v10),
    ],
    products: [
        .library(
            name: "Gravatar",
            targets: ["Gravatar"]),
    ],
    targets: [
        .target(
            name: "Gravatar"),
        .testTarget(
            name: "GravatarTests",
            dependencies: ["Gravatar"]),
    ]
)
