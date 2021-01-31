//
//  FlowControllerTypeMock.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation
@testable import UpInterHomeWork21

class FlowControllerTypeMock: FlowControllerType {

    //MARK: - loginFinished

    var loginFinishedInCallsCount = 0
    var loginFinishedInCalled: Bool {
        return loginFinishedInCallsCount > 0
    }
    var loginFinishedInReceivedView: LoginViewType?
    var loginFinishedInClosure: ((LoginViewType) -> Void)?

    func loginFinished(in view: LoginViewType) {
        loginFinishedInCallsCount += 1
        loginFinishedInReceivedView = view
        loginFinishedInClosure?(view)
    }

}
