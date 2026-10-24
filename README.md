# SwiftTasksGenAI

> [!WARNING]
> **This repository is deprecated and no longer maintained.** Google does not publish a Swift Package Manager product for MediaPipe GenAI / LLM Inference. For on-device LLM inference, migrate to [google-ai-edge/LiteRT-LM](https://github.com/google-ai-edge/LiteRT-LM) (product `LiteRTLM`).

## Why is this deprecated?

SwiftTasksGenAI wrapped Google's MediaPipe GenAI pods so iOS and macOS apps could depend on them with Swift Package Manager. Google has placed the MediaPipe LLM Inference API in maintenance-only mode and recommends the LiteRT-LM Swift API instead. The official MediaPipe package at [google-ai-edge/mediapipe](https://github.com/google-ai-edge/mediapipe) publishes `MediaPipeTasksVision`, `MediaPipeTasksText`, and `MediaPipeTasksAudio`; its `Package.swift` has no GenAI product.

## Migrating to the official package

LiteRT-LM is Google's recommended replacement for this use case. It is a different API: `LlmInference` is not part of `LiteRTLM`, and MediaPipe `.bin` / `.task` models are not `.litertlm` models. The Swift binding is labeled Early Preview on the [LiteRT-LM overview](https://developers.google.com/edge/litert-lm/overview). LiteRT-LM requires iOS 15 and macOS 12.

### Xcode

1. Open your project in Xcode and select File > Add Package Dependencies....
2. Enter the repository URL: `https://github.com/google-ai-edge/LiteRT-LM`
3. Select the `LiteRT-LM` package and choose a dependency rule. Release `v0.18.1` (20 October 2026) was the latest stable release when this notice was written. Up to Next Major Version from `0.18.1` tracks later `0.x` releases.
4. Add the `LiteRTLM` library to your application target. `LiteRTLMFoundationModels` is an Apple Foundation Models adapter and is not the replacement for this package.

If Xcode reports `no such module LiteRTLM`, select the app target, open General > Frameworks, Libraries, and Embedded Content, and add `LiteRTLM`.

### Package.swift

```swift
dependencies: [
    .package(url: "https://github.com/google-ai-edge/LiteRT-LM", from: "0.18.1"),
],
targets: [
    .target(
        name: "MyAppTarget",
        dependencies: [
            .product(name: "LiteRTLM", package: "LiteRT-LM"),
        ]
    ),
]
```

| This package | Official replacement |
| --- | --- |
| Product `SwiftTasksGenAI` | Product `LiteRTLM` |
| `import MediaPipeTasksGenAI` | `import LiteRTLM` |

**Docs:** [LiteRT-LM Swift API](https://developers.google.com/edge/litert-lm/swift) · [LiteRT-LM overview](https://developers.google.com/edge/litert-lm/overview) · [iOS and macOS sample](https://github.com/google-ai-edge/LiteRT-LM/tree/main/samples/ios_and_mac) · [MediaPipe LLM Inference for iOS (maintenance only, CocoaPods)](https://developers.google.com/edge/mediapipe/solutions/genai/llm_inference/ios) · [MediaPipe Tasks iOS setup (Vision, Text, and Audio)](https://developers.google.com/edge/mediapipe/solutions/setup_ios)

Apps that must keep calling `LlmInference` still install `MediaPipeTasksGenAI` and `MediaPipeTasksGenAIC` with CocoaPods, as described in the LLM Inference iOS guide. That API is not in the MediaPipe Swift package.

## Thank you

Thank you to everyone who used SwiftTasksGenAI and to everyone who contributed. Existing tags and release archives stay available so current apps keep building while you move new work to LiteRT-LM.

---

## Legacy documentation

# SwiftTasksGenAI

**SwiftTasksGenAI** is a Swift package that facilitates the integration of Google's MediaPipe GenAI solutions into your iOS applications. By adding this package as a dependency, you can seamlessly access MediaPipe's powerful GenAI APIs without the need for CocoaPods.

> **Disclaimer:** This project is an independent endeavor and is **not affiliated with Google**.

## Features

- **Swift Package Integration:** Simplify your project setup by integrating MediaPipe GenAI through Swift Package Manager.
- **Example Application:** Includes an adapted version of Google's original example app, showcasing integration via Swift Package Manager instead of CocoaPods.
- **Automatic Package Update:** On a daily basis the package is updated by a GitHub Action (if needed) and tracks the MediaPipe GenAI Task Pods versioning.

## Installation

To integrate **MediaPipeTasksGenAI** into your Xcode project using this package:

1. **Add Package Dependency:**
   - Open your project in Xcode.
   - Navigate to `File` > `Add Packages...`.
   - Enter the repository URL for SwiftTasksGenAI.
   - Select the desired version and add the package.
   
2. **Import and Use:**
   - In your Swift files, finally import MediaPipeTasksGenAI:
     ```swift
     import MediaPipeTasksGenAI
     ```
   - Utilize MediaPipe's GenAI APIs as documented.
   
## Example Application

The package includes an adjusted example application (originally from Google) demonstrating use of different LLMs with GenAI. This serves as a practical reference for integrating and utilizing the APIs in your projects.

## About MediaPipe GenAI

[MediaPipe](https://ai.google.dev/edge/mediapipe/solutions/guide) is a cross-platform framework by Google that offers customizable machine learning solutions for live and streaming media. The GenAI component provides state-of-the-art inference APIs.

For detailed information and documentation, refer to the [MediaPipe Tasks Guide](https://ai.google.dev/edge/mediapipe/solutions/tasks).

## License

This project is licensed under the MIT License.

---

*Note: MediaPipe is a trademark of Google. This project is not affiliated with or endorsed by Google.*
