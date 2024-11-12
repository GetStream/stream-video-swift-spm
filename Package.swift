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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.14.1/StreamVideo.zip",
                      checksum: "bc9a8457375e2446d27f0f5e2ecbe96d980b6978fb9da1554b13a9b38faad87e"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.14.1/StreamVideoSwiftUI.zip",
                      checksum: "caee95ce8fa5a3ccfe443c8a6cfc1ed2ca4f1e0f40eb5925874e843a8da4f9b9"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.14.1/StreamVideoUIKit.zip",
                      checksum: "8779a77e336898b3d1bfe3e1d86e23f407c4ef8cbd3b87ff5e8f84c8e6740c90")
    ]
)
