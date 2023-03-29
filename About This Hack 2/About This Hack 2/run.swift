//
//  run.swift
//  About This Hack 2
//
//  Created by Felix on 29.03.23.
//

import Foundation

// Allows native runnning of Terminal commands
func run(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()

    task.standardOutput = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!

    return output
    
}
