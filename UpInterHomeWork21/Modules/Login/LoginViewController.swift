//
//  ViewController.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 06.12.2020.
//

import UIKit

protocol LoginViewType: class {
    var viewController: UIViewController { get }
    func showLoginError(with description: String)
}

class LoginViewController: UIViewController {

    @IBOutlet weak var loginNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    // TODO: dep injection
    var viewModel: LoginViewModelType!

    @IBAction func loginDidChange(_ sender: Any) {
        viewModel.loginNameDidChnage(loginNameField.text ?? "")
    }

    @IBAction func passwordDidChange(_ sender: Any) {
        viewModel.passwordDidChange(passwordField.text ?? "")
    }

    @IBAction func loginAction(_ sender: Any) {
        viewModel.didLogin()
    }
}

extension LoginViewController: LoginViewType {
    func showLoginError(with description: String) {
        let alertController = UIAlertController(
            title: "Error",
            message: description,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }

    var viewController: UIViewController {
        return self
    }

}
