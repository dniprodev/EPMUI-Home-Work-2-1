//
//  FlowControllerTests.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import XCTest
@testable import UpInterHomeWork21

class FlowControllerTests: XCTestCase {

    func test_loginFinished_ToListSwitched() {
        let loginView = LoginViewController()

        let window = UIWindow()
        window.rootViewController = loginView
        window.makeKeyAndVisible()

        makeSUT().loginFinished(in: loginView)

        XCTAssertTrue(window.rootViewController.self?.classForCoder == RandomListViewController.classForCoder())
    }

}

private extension FlowControllerTests {
    func makeSUT() -> FlowController {
        let sut = FlowController()
        return sut
    }
}
