// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "OpenSourceController",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "OpenSourceController", targets: ["OpenSourceController"])
    ],
    targets: [
      .target(
        name: "OpenSourceController",
        path: "",
        sources: ["Sources"]
      )
    ],
    swiftLanguageVersions: [.v4, .v5]
)
