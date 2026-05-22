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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.30.0"),
        .package(url: "https://github.com/GetStream/stream-video-swift-webrtc.git", exact: "137.0.67")
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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.47.0/StreamVideo.zip",
                      checksum: "31ab02c905274fe69e659ffbfcdd5839f36e8d8c863bf9e1e4e230f8b958d58d"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.47.0/StreamVideoSwiftUI.zip",
                      checksum: "b593ff9d8a985f4b7c76bb1f4aa157f58f31aa9e27cabb0db9179fc40c8dcf72"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.47.0/StreamVideoUIKit.zip",
                      checksum: "e0c524eaff6a2dfed6cbea847a1a56d105a46dc86d308458908b1a0ed9fa898b")
    ]
)
