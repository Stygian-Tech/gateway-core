// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "GatewayCore",
  platforms: [
    .macOS(.v14)
  ],
  products: [
    .library(name: "GatewayCore", targets: ["GatewayCore"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Stygian-Tech/atproto-auth-kit.git", revision: "5ad645d14203b19e6d6077b2fb05cec12519d208"),
    .package(url: "https://github.com/Stygian-Tech/gateway-trust-kit.git", revision: "b1508e6bc5f5224aa440304f15365a4a2fdc7596"),
    .package(url: "https://github.com/Stygian-Tech/thin-app-view-core.git", revision: "3b8523ecb1c673c06674ecf27acc225d7d35331a"),
    .package(url: "https://github.com/Stygian-Tech/operations-core.git", revision: "a3b7bb328189a423f3e2d2fdd1dcfd4022faddc1"),
    .package(url: "https://github.com/Stygian-Tech/social-wire-redis.git", revision: "313305b98919ac8075313044b6d867c13650a329"),
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.6.0"),
    .package(url: "https://github.com/vapor/jwt-kit.git", from: "5.0.0"),
    .package(url: "https://github.com/apple/swift-crypto.git", from: "3.14.0"),
    .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.21.0"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.6.0"),
  ],
  targets: [
    .target(
      name: "GatewayCore",
      dependencies: [
        .product(name: "ATProtoAuthKit", package: "atproto-auth-kit"),
        .product(name: "GatewayTrustKit", package: "gateway-trust-kit"),
        .product(name: "ThinAppViewCore", package: "thin-app-view-core"),
        .product(name: "OperationsCore", package: "operations-core"),
        .product(name: "SocialWireRedis", package: "social-wire-redis"),
        .product(name: "Hummingbird", package: "hummingbird"),
        .product(name: "JWTKit", package: "jwt-kit"),
        .product(name: "Crypto", package: "swift-crypto"),
        .product(name: "AsyncHTTPClient", package: "async-http-client"),
        .product(name: "Logging", package: "swift-log"),
      ],
      path: "Sources/GatewayCore",
      swiftSettings: [
        .swiftLanguageMode(.v6),
      ]
    ),
    .testTarget(
      name: "GatewayCoreTests",
      dependencies: [
        "GatewayCore",
        .product(name: "ATProtoAuthKit", package: "atproto-auth-kit"),
        .product(name: "GatewayTrustKit", package: "gateway-trust-kit"),
        .product(name: "AsyncHTTPClient", package: "async-http-client"),
        .product(name: "Hummingbird", package: "hummingbird"),
        .product(name: "HummingbirdTesting", package: "hummingbird"),
        .product(name: "Logging", package: "swift-log"),
        .product(name: "JWTKit", package: "jwt-kit"),
        .product(name: "Crypto", package: "swift-crypto"),
      ],
      path: "Tests/GatewayCoreTests",
      swiftSettings: [
        .swiftLanguageMode(.v6),
      ]
    ),
  ]
)
