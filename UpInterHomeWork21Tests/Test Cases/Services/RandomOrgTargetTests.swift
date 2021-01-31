//
//  RandomOrgTargetTests.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import XCTest
@testable import UpInterHomeWork21

class RandomOrgTargetTests: XCTestCase {

    func test_randomStrings_CorrectAttributes() {
        let target = RandomOrgTarget.randomStrings(count: 15)
        XCTAssertTrue(target.baseURL == URL(string: "https://www.random.org/strings/"))
        XCTAssertTrue(target.path == "num=15&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new")
        XCTAssertTrue(target.method == .get)
    }
}
