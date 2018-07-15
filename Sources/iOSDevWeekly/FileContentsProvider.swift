//
//  FileContentsProvider.swift
//  iOSDevWeekly
//
//  Created by asdfgh1 on 15/07/2018.
//

import Foundation

protocol FileContentsProvider: AnyObject {
    var contents: String? { get set }
}

final class FileContents: FileContentsProvider {

    private let fileUrl: URL

    init(fileName: String) {
        self.fileUrl = CurrentDirectory.url.appendingPathComponent(fileName)
    }

    var contents: String? {
        get {
            return try? String(contentsOf: fileUrl, encoding: .utf8)
        }
        set {
            try? newValue?.write(to: fileUrl, atomically: true, encoding: .utf8)
        }
    }
}
