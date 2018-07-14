//
//  Config.swift
//  FeedKit
//
//  Created by asdfgh1 on 14/07/2018.
//

import Foundation

struct Config: Codable {
    let target: Target
    let consumer: String
    let secret: String
}

enum Target: String, Codable {
    case pocket
    case instapaper
}
