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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.10.0/StreamVideo.zip",
                      checksum: "472e12bb0106ca615eb6b2e6866457e63370c69b610c1e4c16d65d1de856ebb6"),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.10.0/StreamVideoSwiftUI.zip",
                      checksum: "7e266e4b8d5552d52d1b96978fc2dbe1cfab254fa87890ea12d9f2f2a3a16856"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.10.0/StreamVideoUIKit.zip",
                      checksum: "a75518571951b1f3f323853dd6fd204e193ef799799704800f56e99adf5cb065")
    ]
)
