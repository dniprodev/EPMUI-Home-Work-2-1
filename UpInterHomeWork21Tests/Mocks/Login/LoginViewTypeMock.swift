//
//  LoginViewTypeMock.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import UIKit
@testable import UpInterHomeWork21

class LoginViewTypeMock: LoginViewType {
    var viewController: UIViewController {
        get { return underlyingViewController }
        set(value) { underlyingViewController = value }
    }
    var underlyingViewController: UIViewController!

    //MARK: - showLoginError

    var showLoginErrorWithCallsCount = 0
    var showLoginErrorWithCalled: Bool {
        return showLoginErrorWithCallsCount > 0
    }
    var showLoginErrorWithReceivedDescription: String?
    var showLoginErrorWithClosure: ((String) -> Void)?

    func showLoginError(with description: String) {
        showLoginErrorWithCallsCount += 1
        showLoginErrorWithReceivedDescription = description
        showLoginErrorWithClosure?(description)
    }

}
