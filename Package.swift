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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.30.0/StreamVideo.zip",
                      checksum: "975f977179b7f9edd7aa23bc14ff890b8ab9931b5e9cbb39383ffa26fc123f5f"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.30.0/StreamVideoSwiftUI.zip",
                      checksum: "bc634bac25d476237287e90bfe00e68217cc1f28eb598572601b562bf610cb6b"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.30.0/StreamVideoUIKit.zip",
                      checksum: "dcb0a9b37891d9f57213e2ef136385d68e4af430ba361471aaac8c6057157385")
    ]
)
