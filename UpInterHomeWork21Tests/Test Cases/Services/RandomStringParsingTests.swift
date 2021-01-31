//
//  RandomStringParsingTests.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import XCTest
@testable import UpInterHomeWork21

class RandomStringParsingTests: XCTestCase {
    func test_parse_signleLine_parsedCorrectly() {
        let expected = ["single-line"]
        let actual = RandomString.parse(from: "single-line".data(using: .utf8)!).strings
        XCTAssertTrue(expected == actual)
    }

    func test_parse_severalLines_parsedCorrectly() {
        let expected = ["1", "2"]
        let actual = RandomString.parse(from: "1\n2\n".data(using: .utf8)!).strings
        XCTAssertTrue(expected == actual)
    }
}
