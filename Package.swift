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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.15.0/StreamVideo.zip",
                      checksum: "f8b822d3ec927a35ffdf54372fe769a4e0bd1775f67e399e5a4a7b4e1a2318e7"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.15.0/StreamVideoSwiftUI.zip",
                      checksum: "3b039e03773fe8592d1a20b2a76cd643476857917e5882a9efa6c5bad1956794"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.15.0/StreamVideoUIKit.zip",
                      checksum: "b7aad7e6b1be1860ab8d983c0988b3b5cde6462fa8057a8fe2be1085c3a2e8c6")
    ]
)
