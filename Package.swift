// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibXMTP",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "LibXMTP",
            targets: ["LibXMTP", "LibXMTPSwiftFFI"]
        ),
    ],
    targets: [
        .target(
            name: "LibXMTP",
            dependencies: ["LibXMTPSwiftFFI"],
            path: "Sources/LibXMTP",
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("SystemConfiguration")
            ]
        ),
        .binaryTarget(
            name: "LibXMTPSwiftFFI",
            url: "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-1.3.3.9532653/LibXMTPSwiftFFI.zip",
            checksum: "2d295cc2bfa98a3e5c508e9c3d1e224d9ebc7537068b18846d0cd4c17e15df72"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
