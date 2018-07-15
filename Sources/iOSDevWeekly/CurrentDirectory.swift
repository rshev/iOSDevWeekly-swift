//
//  CurrentDirectory.swift
//  iOSDevWeekly
//
//  Created by asdfgh1 on 15/07/2018.
//

import Foundation

enum CurrentDirectory {

    static var url: URL {
        let commandLineArguments = CommandLine.arguments.dropFirst()

        if let cmdlineArgument = commandLineArguments.first {
            return URL(fileURLWithPath: cmdlineArgument).deletingLastPathComponent()
        } else {
            return Bundle.main.executableURL?.deletingLastPathComponent() ?? URL(fileURLWithPath: "./", isDirectory: true)
        }
    }
}
