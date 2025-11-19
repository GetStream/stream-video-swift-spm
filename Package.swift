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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.36.0/StreamVideo.zip",
                      checksum: "a2886a43d48969fd94aeab510ae01a941709392fd05b308ab3ebe874567b7240"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.36.0/StreamVideoSwiftUI.zip",
                      checksum: "807a209d4b018cc4ab3998d68b449fc9b12cab0691cb88c13cd2c7532d3fa53e"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.36.0/StreamVideoUIKit.zip",
                      checksum: "d8fcbe9f1c031d83da3ed42a85eea4e19e8f96acc915b869511c5463ea892de1")
    ]
)
