// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GuildKit",
  platforms: [.iOS(.v14), .macOS(.v10_15)],
  products: [
    .library(
      name: "GuildKit",
      targets: ["GuildKit"]
    )
  ],
  dependencies: [
    .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.2.1")
  ],
  targets: [
    .target(
      name: "GuildKit",
      dependencies: ["Lottie"],
      path: "Sources"
      // resources: [.copy("Resources")]
    ),
    .testTarget(
      name: "GuildKitTests",
      dependencies: ["GuildKit"],
      path: "Tests"
    )
  ]
)
