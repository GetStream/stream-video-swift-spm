// swift-tools-version:5.9

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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.29.0"),
        .package(url: "https://github.com/GetStream/stream-video-swift-webrtc.git", exact: "125.6422.065")
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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.38.0/StreamVideo.zip",
                      checksum: "0fb09b3fc5e732eaab3d0434965e0b2eecebfcf5a9cec724a634e0a98356a994"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.38.0/StreamVideoSwiftUI.zip",
                      checksum: "c5730df894ff1d9e52c199d94ac7c5ab27fc7d4e9df13290a449d94e651bdb59"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.38.0/StreamVideoUIKit.zip",
                      checksum: "ca113aa041884a60eb2091cb80eed213a930b9879b4ce6a874c04fb2275b1f05")
    ]
)
