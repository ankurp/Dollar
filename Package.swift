// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "Dollar",
  platforms: [
    .iOS(.v9),
    .macOS(.v11),
    .tvOS(.v9),
    .watchOS(.v2),
    .visionOS(.v1)
  ],
  products: [
    .library(name: "Dollar", targets: ["Dollar"]),
  ],
  targets: [
    .target(name: "Dollar", path: "Sources")
  ]
)