// swift-tools-version:5.3
import PackageDescription
import Foundation

let package = Package(
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
            .package(
                name: "LibXMTPRust",
                path: "LibXMTPRust.xcframework")
        ]
)
