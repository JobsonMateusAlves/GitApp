// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationLayer",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "PresentationLayer",
            targets: ["PresentationLayer"]
        ),
    ],
    dependencies: [
        .package(name: "DomainLayer", path: "../DomainLayer")
    ],
    targets: [
        .target(
            name: "PresentationLayer",
            dependencies: [
                "DomainLayer"
            ]
        ),
        .testTarget(
            name: "PresentationLayerTests",
            dependencies: ["PresentationLayer"]
        ),
    ]
)
