// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Apollo",
    products: [
        .library(name: "Apollo", type: .dynamic, targets: ["Apollo"])
    ],
    targets: [
        .target(name: "Apollo"),
    ]
)
