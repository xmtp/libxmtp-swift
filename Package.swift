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
            url: "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-ab9d335/LibXMTPSwiftFFI.zip",
            checksum: "f3b85d4241a1708da4d0d02e518b93974e5a97a7cf1ae445f05f1d63f72aba12"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
