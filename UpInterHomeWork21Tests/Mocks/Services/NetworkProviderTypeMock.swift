//
//  NetworkProviderTypeMock.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 08.12.2020.
//

import Foundation
@testable import UpInterHomeWork21

class NetworkProviderTypeMock: NetworkProviderType {

    //MARK: - sendRequest

    var sendRequestCompletionCallsCount = 0
    var sendRequestCompletionCalled: Bool {
        return sendRequestCompletionCallsCount > 0
    }
    var sendRequestCompletionReceivedArguments: (target: TargetType, completion: NetworkCompletionHandler)?
    var sendRequestCompletionClosure: ((TargetType, @escaping(NetworkCompletionHandler)) -> Void)?

    func sendRequest(_ target: TargetType, completion: @escaping(NetworkCompletionHandler)) {
        sendRequestCompletionCallsCount += 1
        sendRequestCompletionReceivedArguments = (target: target, completion: completion)
        sendRequestCompletionClosure?(target, completion)
    }

}
