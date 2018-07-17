//
//  Extensions.swift
//  iOSDevWeekly
//
//  Created by asdfgh1 on 17/07/2018.
//

import Foundation

extension NSRange {

    func stringRange(in string: String) -> Range<String.Index>? {
        return Range<String.Index>.init(self, in: string)
    }
}
