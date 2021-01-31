//
//  LoginInitializer.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import UIKit

struct LoginInitializer {
    static func intialize() -> LoginViewType {
        guard let view = UIStoryboard(name: "LoginScreen", bundle: nil)
                .instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError("LoginViewController is not of the expected class LoginViewController.")
        }

        let viewModel = LoginViewModel()
        viewModel.flowController = FlowController()
        viewModel.view = view

        view.viewModel = viewModel

        return view
    }
}
