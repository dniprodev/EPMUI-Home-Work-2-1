// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "UpInterHomeWork21",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
//        .library(
//            name: "UpInterHomeWork21",
//            targets: ["UpInterHomeWork21"]
//        ),
        .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]) // dev
    ],
    dependencies: [
        .package(name: "danger-swift", url: "https://github.com/danger/swift.git", from: "3.0.0"),
        // Danger Plugins
        .package(name: "DangerSwiftCoverage", url: "https://github.com/f-meloni/danger-swift-coverage", from: "1.2.1") // dev
    ],
    targets: [
        // This is just an arbitrary Swift file in our app, that has
        // no dependencies outside of Foundation, the dependencies section
        // ensures that the library for Danger gets build also.
//        .target(
//            name: "UpInterHomeWork21",
//            path: "UpInterHomeWork21"
//        ),
//        .testTarget(
//            name: "UpInterHomeWork21Tests",
//            dependencies: ["UpInterHomeWork21"],
//            path: "UpInterHomeWork21Tests"
//        ),
        .target(name: "DangerDependencies", dependencies: ["danger-swift", "DangerSwiftCoverage"]), // dev
    ]
)

