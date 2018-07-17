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

    enum Error: Swift.Error {
        case feedKitInit
        case feedKitParse
        case noFeedItems
    }

    init(
        config: Config,
        lastGuid: FileContentsProvider = FileContents(fileName: Constant.lastKnownGuidFilename)
    ) {
        self.config = config
        self.lastGuid = lastGuid
    }

    func start() throws {
        let feedUrl = Constant.feedUrl

        guard let parser = FeedKit.FeedParser(URL: feedUrl) else {
            throw Error.feedKitInit
        }

        let parseResult = parser.parse()
        guard parseResult.isSuccess, let feed = parseResult.rssFeed else {
            throw Error.feedKitParse
        }

        try parse(feed: feed)
    }

    private func parse(feed: RSSFeed) throws {
        guard
            let firstItem = feed.items?.first,
            let guid = firstItem.guid?.value,
            let description = firstItem.description
        else {
            throw Error.noFeedItems
        }

        if guid == lastGuid.contents {
            // TODO: output .successDoneNoItems
            print("GUID has already been processed")
            return
        }

        let descriptionRange = NSRange(description.startIndex..<description.endIndex, in: description)

        let regex = Constant.linksRegex
        regex.enumerateMatches(
            in: description,
            options: [],
            range: descriptionRange
        ) { (result, _, _) in
            guard
                let result = result,
                result.numberOfRanges - 1 == regex.numberOfCaptureGroups,
                let urlRange = result.range(at: 1).stringRange(in: description),
                let titleRange = result.range(at: 2).stringRange(in: description)
            else {
                return
            }

            let url =  description[urlRange]
            let title = description[titleRange]

            // TODO: target pusher => push
            // TODO: output .done element
            print("\(title) \(url)")
        }

        lastGuid.contents = guid
        // TODO: output .successDone
        print("SUCCESS")
    }
}
