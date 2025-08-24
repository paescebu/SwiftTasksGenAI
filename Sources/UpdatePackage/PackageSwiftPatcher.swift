//
//  PackagePatcher.swift
//  SwiftTasksGenAI
//
//  Created by Pascal Burlet on 23.08.2025.
//

import Foundation
import RegexBuilder

class PackagePatcher {
    static func updateBinaryTargets(
        in packageSwiftURL: URL,
        with targets: [BinaryTarget]
    ) throws {
        guard FileManager.default.fileExists(atPath: packageSwiftURL.path) else {
            throw NSError(domain: "UpdatePackage", code: 1, userInfo: [
                NSLocalizedDescriptionKey: "Package.swift not found at \(packageSwiftURL.path)"
            ])
        }

        var contents = try String(contentsOf: packageSwiftURL, encoding: .utf8)

        // Replace each existing .binaryTarget by name
        for target in targets {
            let pattern = try NSRegularExpression(
                pattern: #"(?m)(\s*)\.binaryTarget\s*\(\s*name:\s*"\#(target.name)".*?\)"#,
                options: [.dotMatchesLineSeparators]
            )

            contents = pattern.stringByReplacingMatches(
                in: contents,
                options: [],
                range: NSRange(contents.startIndex..<contents.endIndex, in: contents),
                withTemplate: "$1.binaryTarget($1    name: \"\(target.name)\",$1    url: \"\(target.url)\",$1    checksum: \"\(target.checksum)\"$1)"
            )
        }

        try contents.write(to: packageSwiftURL, atomically: true, encoding: .utf8)
    }
}
