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
            targets: ["StreamVideoWrapper"]
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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.18.0"),
        .package(url: "https://github.com/GetStream/stream-video-swift-webrtc.git", exact: "114.5735.08")
    ],
    targets: [
        .target(
            name: "StreamVideoWrapper",
            dependencies: [
                .target(name: "StreamVideo"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "StreamWebRTC", package: "stream-video-swift-webrtc")
            ]
        ),
        .binaryTarget(name: "StreamVideo",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.13.0/StreamVideo.zip",
                      checksum: "72c91223c26cf55812550e7d34ddfab61fbfcff6e498aa7c6215c4bce129cb4f"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.13.0/StreamVideoSwiftUI.zip",
                      checksum: "5ad77d5bcfdb2aae03a157fe30a96c250b36ceff4b77da2483ed0b2d44db46af"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.13.0/StreamVideoUIKit.zip",
                      checksum: "000b5668e45c50c5efd736448f2f069f5cf9c0f41436d075c5876e848dafe84f")
    ]
)
