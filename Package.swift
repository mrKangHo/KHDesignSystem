// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KHDesignSystem",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KHDesignSystem",
            targets: ["KHDesignSystem"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "KHDesignSystem",
            path: "Sources/KHDesignSystem",
            resources: [.process("Fonts/Resources/SUITE-Bold.otf"),
                        .process("Fonts/Resources/SUITE-ExtraBold.otf"),
                        .process("Fonts/Resources/SUITE-Heavy.otf"),
                        .process("Fonts/Resources/SUITE-Light.otf"),
                        .process("Fonts/Resources/SUITE-Medium.otf"),
                        .process("Fonts/Resources/SUITE-Regular.otf"),
                        .process("Fonts/Resources/SUITE-SemiBold.otf")]),
        .testTarget(
            name: "KHDesignSystemTests",
            dependencies: ["KHDesignSystem"]),
    ]
)
