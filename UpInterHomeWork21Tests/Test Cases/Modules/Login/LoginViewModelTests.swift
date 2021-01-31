//
//  LoginViewModelTests.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import XCTest
@testable import UpInterHomeWork21

class LoginViewModelTests: XCTestCase {
    var view: LoginViewTypeMock!
    var flowController: FlowControllerTypeMock!

    override func setUp() {
        view = LoginViewTypeMock()
        flowController = FlowControllerTypeMock()
    }

    func test_didLogin_correctCreds_ListOpened() {
        let sut = makeSUT()
        sut.loginNameDidChnage("user")
        sut.passwordDidChange("123qwe")

        sut.didLogin()

        XCTAssertTrue(flowController.loginFinishedInCalled)
        XCTAssertFalse(view.showLoginErrorWithCalled)
    }

    func test_didLogin_notCorrectCreds_ErrorShowed() {
        let sut = makeSUT()
        sut.loginNameDidChnage("wrong login name")
        sut.passwordDidChange("wrong password")

        sut.didLogin()

        XCTAssertTrue(view.showLoginErrorWithCalled)
        XCTAssertFalse(flowController.loginFinishedInCalled)
    }

}

private extension LoginViewModelTests {
    func makeSUT() -> LoginViewModel {
        let sut = LoginViewModel()
        sut.flowController = flowController
        sut.view = view
        return sut
    }
}
