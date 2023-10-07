// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BAK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BAK",
            targets: ["BAK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework.git", from: "6.9.0"),
        .package(
            url: "https://github.com/facebook/facebook-ios-sdk.git", branch: "main"),
        .package(
            url: "https://github.com/qasim/TikTokOpenSDK.git", from: "5.0.0"),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.6.0")


    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BAK",
            dependencies: [
                .target(name: "BAKFramework"),
                
                .target(name: "OneSignal"),
                .target(name: "OneSignalCore"),
                .target(name: "OneSignalExtension"),
                .target(name: "OneSignalOutcomes"),
                
                .product(name: "AppsFlyerLib", package: "AppsFlyerFramework"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                
                .byName(name:  "TikTokOpenSDK")
            ]),
        
        .binaryTarget(
            name: "BAKFramework",
            path: "./Sources/BAKFramework.xcframework"),
        
        .binaryTarget(
            name: "OneSignal",
            path: "./Sources/OneSignal.xcframework"),
    
        .binaryTarget(
            name: "OneSignalCore",
            path: "./Sources/OneSignalCore.xcframework"),
    
        .binaryTarget(
            name: "OneSignalExtension",
            path: "./Sources/OneSignalExtension.xcframework"),
    
        .binaryTarget(
            name: "OneSignalOutcomes",
            path: "./Sources/OneSignalOutcomes.xcframework"),
    ]
)
