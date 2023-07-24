// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataLayer",
    products: [
        .library(
            name: "DataLayer",
            targets: ["DataLayer"]
        ),
    ],
    dependencies: [
        .package(name: "Network", path: "../Network"),
        .package(name: "DomainLayer", path: "../DomainLayer")
        
    ],
    targets: [
        .target(
            name: "DataLayer",
            dependencies: [
                "Network",
                "DomainLayer"
            ]
        ),
        .testTarget(
            name: "DataLayerTests",
            dependencies: ["DataLayer"]
        ),
    ]
)
