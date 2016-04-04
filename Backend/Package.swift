#if os(Linux)
import PackageDescription

let package = Package(
    dependencies: [
        // Require swift Riffle 0.2.*
        .Package(url: "https://github.com/exis-io/swiftRiffleUbuntu.git", majorVersion: 0, minor: 2)
    ]
)
#endif
