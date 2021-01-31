//
//  LoginViewModel.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 06.12.2020.
//

import Foundation

struct UserCredentials {
    let loginName: String
    let password: String

    func update(loginName: String) -> UserCredentials {
        return UserCredentials(loginName: loginName, password: password)
    }

    func update(password: String) -> UserCredentials {
        return UserCredentials(loginName: loginName, password: password)
    }
}

protocol LoginViewModelType {
    func didLogin()
    func loginNameDidChnage(_ loginName: String)
    func passwordDidChange(_ password: String)
}

class LoginViewModel: LoginViewModelType {

    private var userCredentials = UserCredentials(loginName: "", password: "")

    var flowController: FlowControllerType!
    weak var view: LoginViewType!

    func didLogin() {
        guard validateCredentials() == .valid else {
            view.showLoginError(with: "Smth wrong with creds!")
            return
        }

        flowController.loginFinished(in: view)
    }

    func loginNameDidChnage(_ loginName: String) {
        self.userCredentials = userCredentials.update(loginName: loginName)
    }

    func passwordDidChange(_ password: String) {
        self.userCredentials = userCredentials.update(password: password)
    }
}

private extension LoginViewModel {
    enum CredentialsValidationResult {
        case valid
        case notValit
    }

    func validateCredentials() -> CredentialsValidationResult {
        guard userCredentials.loginName == "user" else {
            return .notValit
        }

        guard userCredentials.password == "123qwe" else {
            return .notValit
        }

        return .valid
    }
}
