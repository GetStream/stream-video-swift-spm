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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.5/StreamVideo.zip",
                      checksum: "eb54762bd50b5c3756cc0da14ccdde8b4fad51cf3bd7d7da0899136e2e735b86",
                      dependencies: [
                          .product(name: "WebRTC", package: "Specs"),
                          .product(name: "SwiftProtobuf", package: "swift-protobuf")
                      ]),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.5/StreamVideoSwiftUI.zip",
                      checksum: "5de2f6960c481356ae4ab18e9f81715d4736d38b2e51b8408918831bcc54aee1"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.5/StreamVideoUIKit.zip",
                      checksum: "55d8a5560c29f7e57f03df73243c5543646c52ffcafe65e28a4d3738d07ebd04")
    ]
)
