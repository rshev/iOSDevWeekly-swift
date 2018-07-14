//
//  Constant.swift
//  FeedKit
//
//  Created by asdfgh1 on 14/07/2018.
//

import Foundation

enum Constant {
    static let feedUrl = URL(string: "https://iosdevweekly.com/issues.rss")!
    static let linksRegex = try! NSRegularExpression(pattern: "<h4><a href=\"(.*)\">(.*)</a></h4>", options: [])
    static let lastKnownGuidFilename = ".lastKnownGuid"

    enum Instapaper {
        static let apiAddUrl = URL(string: "https://www.instapaper.com/api/add")!
    }

    enum Pocket {
        static let apiAddUrl = URL(string: "https://getpocket.com/v3/add")!
    }
}
