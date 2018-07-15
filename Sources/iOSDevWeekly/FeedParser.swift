//
//  FeedParser.swift
//  iOSDevWeekly
//
//  Created by asdfgh1 on 14/07/2018.
//

import Foundation
import FeedKit

final class FeedParser {

    private let config: Config
    private let lastGuid: FileContentsProvider

    init(
        config: Config,
        lastGuid: FileContentsProvider = FileContents(fileName: Constant.lastKnownGuidFilename)
    ) {
        self.config = config
        self.lastGuid = lastGuid
    }

    func start() {

    }
}
