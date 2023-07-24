// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DomainLayer",
    products: [
        .library(
            name: "DomainLayer",
            targets: ["DomainLayer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DomainLayer",
            dependencies: []
        ),
        .testTarget(
            name: "DomainLayerTests",
            dependencies: ["DomainLayer"]
        ),
    ]
)
