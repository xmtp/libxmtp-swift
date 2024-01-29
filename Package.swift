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
            path: "Sources/LibXMTP"
        ),
        .binaryTarget(
            name: "LibXMTPSwiftFFI",
            url: "https://github.com/xmtp/libxmtp/releases/download/test-swift-bindings-ecb15b7/LibXMTPSwiftFFI.zip",
            checksum: "82ffd012586c96cae38ce48010f828b3094023d745a891b79fe7afc39767c95a"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
