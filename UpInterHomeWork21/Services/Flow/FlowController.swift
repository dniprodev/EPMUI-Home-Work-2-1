//
//  FlowController.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 06.12.2020.
//

import UIKit

// TODO: Pass control to FlowController right after launch

protocol FlowControllerType {
    func loginFinished(in view: LoginViewType)
}

struct FlowController: FlowControllerType {
    func loginFinished(in view: LoginViewType) {
        let randomListView = RandomListInitializer.intialize().viewController
        let window = view.viewController.view.window
        window?.rootViewController = randomListView
    }
}
