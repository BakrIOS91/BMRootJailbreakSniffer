// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "bm_root_jailbreak_sniffer",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "bm-root-jailbreak-sniffer", targets: ["bm_root_jailbreak_sniffer"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/securing/IOSSecuritySuite.git", .upToNextMinor(from: "1.9.10"))
    ],
    targets: [
        .target(
            name: "bm_root_jailbreak_sniffer",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "IOSSecuritySuite", package: "IOSSecuritySuite")
            ]
        )
    ]
)
