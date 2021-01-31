//
//  RandomStuffServiceTypeMock.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation
@testable import UpInterHomeWork21

class RandomStuffServiceTypeMock: RandomStuffServiceType {

    //MARK: - fetchRandomStrings

    var fetchRandomStringsWithCompletionCallsCount = 0
    var fetchRandomStringsWithCompletionCalled: Bool {
        return fetchRandomStringsWithCompletionCallsCount > 0
    }
    var fetchRandomStringsWithCompletionReceivedArguments: (count: Int, completion: (Result<RandomString, Error>) -> Void)?
    var fetchRandomStringsWithCompletionClosure: ((Int, @escaping (Result<RandomString, Error>) -> Void) -> Void)?

    func fetchRandomStrings(with count: Int, completion: @escaping (Result<RandomString, Error>) -> Void) {
        fetchRandomStringsWithCompletionCallsCount += 1
        fetchRandomStringsWithCompletionReceivedArguments = (count: count, completion: completion)
        fetchRandomStringsWithCompletionClosure?(count, completion)
    }

}
