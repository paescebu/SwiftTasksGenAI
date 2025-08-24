//
//  Definitions.swift
//  SwiftVisionTasks
//
//  Created by Pascal Burlet on 03.03.2025.
//

import Foundation

@available(macOS 16.0.0, *)
enum Definitions {
    private static let currentFile = URL(#file)!
    static let packageRoot = URL(string: currentFile.path)!
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
    static let temporaryProjectRoot = packageRoot
        .appending(path: "MediaPipeTasksGenAIC")
}
