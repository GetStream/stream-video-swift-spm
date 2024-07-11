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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.18.0")
        .package(url: "https://github.com/GetStream/stream-video-swift-webrtc.git", exact: "114.5735.08")
    ],
    targets: [
        .binaryTarget(name: "StreamVideo",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.8/StreamVideo.zip",
                      checksum: "2b09fcaeafb551550b7508fc723df55e11dd5acd96c6b44734ed3c1eccc144bb",
                      dependencies: [
                          .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                          .product(name: "StreamWebRTC", package: "stream-video-swift-webrtc")
                      ]),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.8/StreamVideoSwiftUI.zip",
                      checksum: "fc16487252fd75b807c3feda6b70f77790747420dabfb12db58226f643c95875"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.8/StreamVideoUIKit.zip",
                      checksum: "1fc4624e3d6e976bc71662c3996b11547aefa32dd8925173ecfb902b16275bfd")
    ]
)
