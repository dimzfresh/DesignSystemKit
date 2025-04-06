// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystemKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DesignSystemKit",
            targets: ["DesignSystemKit"])
    ],
    targets: [
        .target(
            name: "DesignSystemKit"),
        .testTarget(
            name: "DesignSystemKitTests",
            dependencies: ["DesignSystemKit"]
        )
    ]
)
