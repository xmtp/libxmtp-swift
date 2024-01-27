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
            url: "https://github.com/xmtp/libxmtp/releases/download/test-swift-bindings-refs%2Fheads%2Fcv%2Frelease-swift-bindings/LibXMTPSwiftFFI.zip",
            checksum: "fbdf13a861f7fb2618ffd7316c89c3efd71510bd93b21b598adfd11b6116100e"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
