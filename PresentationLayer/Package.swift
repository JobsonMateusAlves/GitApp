// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationLayer",
    products: [
        .library(
            name: "PresentationLayer",
            targets: ["PresentationLayer"]
        ),
    ],
    dependencies: [
        .package(name: "DomainLayer", path: "../DomainLayer"),
        .package(name: "DataLayer", path: "../DataLayer")
    ],
    targets: [
        .target(
            name: "PresentationLayer",
            dependencies: [
                "DomainLayer",
                "DataLayer"
            ]
        ),
        .testTarget(
            name: "PresentationLayerTests",
            dependencies: ["PresentationLayer"]
        ),
    ]
)
