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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.28.0/StreamVideo.zip",
                      checksum: "80ea52bddd4a1888f02d47b2b557e4d1ab116baaa4a0b828815817d3051830cb"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.28.0/StreamVideoSwiftUI.zip",
                      checksum: "3cb7351d2d90542c5b4d11eea613f2fd4ca628a59d5b83b61a139730285aa449"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.28.0/StreamVideoUIKit.zip",
                      checksum: "9b96438bf16eb73dff0227c55a29aa04b2b8fc00a89a4010beb5ef04abd0ef36")
    ]
)
