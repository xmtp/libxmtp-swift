<<<<<<< Updated upstream
// swift-tools-version:5.9
=======
import Foundation
// swift-tools-version:5.3
>>>>>>> Stashed changes
import PackageDescription

let package = Package(
<<<<<<< Updated upstream
        name: "LibXMTP",
        platforms: [
            .iOS(.v13), 
            .macOS(.v11)
        ],
        products: [
            .library(
                name: "LibXMTP",
                targets: ["LibXMTP", "LibXMTPRust"]),
        ],
        targets: [
            .target(
                name: "LibXMTP",
                dependencies: ["LibXMTPRust"],
                path: "Sources/LibXMTP"
            ),
            .binaryTarget(
                name: "LibXMTPRust",
                path: "./LibXMTPRust.xcframework")
        ]
=======
    name: "LibXMTP",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "LibXMTP",
            targets: ["LibXMTP", "LibXMTPRust"]
        ),
    ],
    targets: [
        .target(
            name: "LibXMTP",
            dependencies: ["LibXMTPRust"],
            path: "Sources/LibXMTP"
        ),
        .binaryTarget(
            name: "LibXMTPRust",
            path: "LibXMTPRust.xcframework"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
>>>>>>> Stashed changes
)
