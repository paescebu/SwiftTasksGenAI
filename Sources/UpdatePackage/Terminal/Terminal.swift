//
//  PackagePreparation.swift
//  SwiftVisionTasks
//
//  Created by Pascal Burlet on 27.02.2025.
//


import Foundation

class Terminal {
    /// Runs a shell command and prints the output.
    /// Returns the exit code.
    @discardableResult
    static func runCommand(_ command: String) -> Int32 {
        print("[Running] \(command)")
    #if os(macOS)
        let process = Process()
        process.launchPath = "/bin/bash"
        process.arguments = ["-c", command]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe
        process.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let str = String(data: data, encoding: .utf8) {
            print(str, terminator: "")
        }

        process.waitUntilExit()
        return process.terminationStatus
    #else
        return 0
    #endif
    }

    /// Runs a shell command and returns stdout as String.
    static func runCommandCapture(_ command: String) -> String {
    #if os(macOS)
        let process = Process()
        process.launchPath = "/bin/bash"
        process.arguments = ["-c", command]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe
        process.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()

        return String(data: data, encoding: .utf8) ?? ""
    #else
        return ""
    #endif
    }
}
