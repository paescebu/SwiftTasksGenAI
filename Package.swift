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
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.0.0/Placeholder.xcframework.zip",
            checksum: "036eebe20ef2a8a7db46a90838c4b20cb86aad8286fe07a89e0d598fe405e9e0"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.0.0/PlaceholderCLibraries.xcframework.zip",
            checksum: "3411a886e35c14b494b774c21d69ba6be9b1291a2e852198860dbdd93de15ca1"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.0.0/PlaceholderC.xcframework.zip",
            checksum: "6126038ff8d0699c097cd007718e17f067c621c9dadb0c85788fb8e7a431e9cd"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
