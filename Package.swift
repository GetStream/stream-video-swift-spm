// swift-tools-version:5.6

import Foundation
import PackageDescription

let package = Package(
    name: "StreamVideo",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13), .macOS(.v11)
    ],
    products: [
        .library(
            name: "StreamVideo",
            targets: ["StreamVideo"]
        ),
        .library(
            name: "StreamVideoSwiftUI",
            targets: ["StreamVideoSwiftUI"]
        ),
        .library(
            name: "StreamVideoUIKit",
            targets: ["StreamVideoUIKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/webrtc-sdk/Specs.git", exact: "114.5735.8"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.18.0")
    ],
    targets: [
        .binaryTarget(name: "StreamVideo",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.4/StreamVideo.zip",
                      checksum: "077e2a036ac95ad7113ec4c6bb94447866679568132a9bc876723bd76b682b4d",
                      dependencies: [
                          .product(name: "WebRTC", package: "Specs"),
                          .product(name: "SwiftProtobuf", package: "swift-protobuf")
                      ]),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.4/StreamVideoSwiftUI.zip",
                      checksum: "6fbad4017c0b8c12dd8f35c26c2bbe4ef750f933aa621efe2442d291863a4c28"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.4/StreamVideoUIKit.zip",
                      checksum: "7d1eb36489225d78755086fa06680b0d818d4ccfde69a53b4b842e9975d96109")
    ]
)
