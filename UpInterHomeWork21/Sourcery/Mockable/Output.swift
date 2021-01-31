// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

class NetworkProviderTypeMock: NetworkProviderType {

    // MARK: - sendRequest

    var sendRequestCompletionCallsCount = 0
    var sendRequestCompletionCalled: Bool {
        return sendRequestCompletionCallsCount > 0
    }
    var sendRequestCompletionReceivedArguments: (target: TargetType, completion: Void)?
    var sendRequestCompletionClosure: ((TargetType, @escaping(NetworkCompletionHandler)) -> Void)?

    func sendRequest(_ target: TargetType, completion: @escaping(NetworkCompletionHandler)) {
        sendRequestCompletionCallsCount += 1
        sendRequestCompletionReceivedArguments = (target: target, completion: completion)
        sendRequestCompletionClosure?(target, completion)
    }

}
