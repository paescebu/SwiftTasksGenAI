// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftTasksGenAI",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTasksGenAI",
            targets: ["SwiftTasksGenAI"]
        ),
        .executable(
            name: "UpdatePackage",
            targets: ["UpdatePackage"]
        )
    ],
    targets: [
        .target(
            name: "SwiftTasksGenAI",
            dependencies: ["SwiftTasksGenAICore"]
        ),
        .target(
            name: "SwiftTasksGenAICore",
            dependencies: [
                "MediaPipeGenAICLibraries",
                "MediaPipeTasksGenAIC",
                "MediaPipeTasksGenAI"
            ],
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAI",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeTasksGenAI.xcframework.zip",
            checksum: "4f935727160f42876231da823b4b8de76d3a19109c1ce4166b01744d34cdf16f"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeGenAICLibraries.xcframework.zip",
            checksum: "a2329d3f86fdc4a16fc315ff7aa35a7264ab52b5548a64fc2ea9e89ecd5ea5ee"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeTasksGenAIC.xcframework.zip",
            checksum: "d238f9b2b826b1ca5af720ebc7336a2a18413bceeea67cfd242b6b8e99e14b4f"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
