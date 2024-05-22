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
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.3/StreamVideo.zip",
                      checksum: "53b9288a48dae8a1e349f10634e7ab468fb37ec273fd5275bb9c6a1131688798",
                      dependencies: [
                          .product(name: "WebRTC", package: "Specs"),
                          .product(name: "SwiftProtobuf", package: "swift-protobuf")
                      ]),
        .binaryTarget(name: "StreamVideoSwiftUI",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.3/StreamVideoSwiftUI.zip",
                      checksum: "41c7d17fc22f19330290bbc2477e52aeedce82d6b64a40407784cb16f0c3732f"),
        .binaryTarget(name: "StreamVideoUIKit",
                      url: "https://github.com/GetStream/stream-video-swift/releases/download/1.0.3/StreamVideoUIKit.zip",
                      checksum: "667f30d8e079044b381791d490ed363d582c9c2528cce7727fcfe01c242e91e5")
    ]
)
