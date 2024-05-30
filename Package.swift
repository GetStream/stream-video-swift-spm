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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.6/StreamVideo.zip",
                      checksum: "24a40aa696925d48d7b37b522acc8994004afdef9c774913441a78a5e62cddfc",
                      dependencies: [
                          .product(name: "WebRTC", package: "Specs"),
                          .product(name: "SwiftProtobuf", package: "swift-protobuf")
                      ]),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.6/StreamVideoSwiftUI.zip",
                      checksum: "164a7ab454443ecb9b7be1094a869a0e0fcb1dfab6d5a513461643a1c1ffc45f"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.6/StreamVideoUIKit.zip",
                      checksum: "9e0f9edac7ec0373668c8e8750b760e139d243752c925ee8752d1f267cebeb1e")
    ]
)
