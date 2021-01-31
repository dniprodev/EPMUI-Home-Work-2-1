//
//  RandomStrings.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation

struct RandomString {
    let strings: [String]
}

extension RandomString {
    static func parse(from data: Data) -> RandomString {
        let linesFlat = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lines = linesFlat?.components(separatedBy: .newlines) ?? []
        return RandomString(strings: lines)
    }
}
