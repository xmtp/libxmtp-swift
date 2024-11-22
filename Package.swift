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
    dependencies: [
        .package(
            url: "https://github.com/sqlcipher/sqlcipher",
            exact: "4.5.7"
        )
    ],
    targets: [
        .target(
            name: "LibXMTP",
            dependencies: [
                "LibXMTPSwiftFFI",
                .product(name: "SQLCipher", package: "sqlcipher")
            ],
            path: "Sources/LibXMTP",
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("SystemConfiguration"),
                .unsafeFlags(["-lsqlcipher"]) // Ensure SQLCipher is linked
            ]
        ),
        .binaryTarget(
            name: "LibXMTPSwiftFFI",
            url: "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-64ccd3a/LibXMTPSwiftFFI.zip",
            checksum: "02590abb8f12f84daeb59b34e86c8d53422d155c3d4347a4493b79dd7f2600a3"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
