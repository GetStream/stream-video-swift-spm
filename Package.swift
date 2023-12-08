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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/0.4.2/StreamVideo.zip",
                      checksum: "64cea9aed5fd45bb7dc3f5a7106b9d79cd3a96b6d9948575c17c7242f93ae13b",
                      dependencies: [
                          .product(name: "WebRTC", package: "Specs"),
                          .product(name: "SwiftProtobuf", package: "swift-protobuf")
                      ]),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/0.4.2/StreamVideoSwiftUI.zip",
                      checksum: "cd9972ad2d05849e7f0ddedb776aae07d5df387440e03c92e5292412ab771d2c"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/0.4.2/StreamVideoUIKit.zip",
                      checksum: "a66ef4ebdcce2351718f6da7e9970f4f217d01ee857567a3c7e4c6cdfea34596")
    ]
)
