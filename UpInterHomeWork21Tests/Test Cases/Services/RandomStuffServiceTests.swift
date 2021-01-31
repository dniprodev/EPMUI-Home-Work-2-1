//
//  RandomStuffServiceTests.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 08.12.2020.
//

import XCTest
@testable import UpInterHomeWork21

class RandomStuffServiceTests: XCTestCase {
    var networkProvider: NetworkProviderTypeMock!

    override func setUp() {
        networkProvider = NetworkProviderTypeMock()
    }

    func test_fetchRandomStrings_networkProviderCalled() {
        let sut = makeSUT()
        sut.fetchRandomStrings(with: 0, completion: {_ in})

        XCTAssertTrue(networkProvider.sendRequestCompletionCallsCount == 1)
    }

    func test_fetchRandomStrings_successResponse_resultCorrect() {
        let sut = makeSUT()
        networkProvider.sendRequestCompletionClosure = { target, completion in
            completion(.success("1\n2".data(using: .utf8)!))
        }
        sut.fetchRandomStrings(with: 0) { result in
            switch result {
            case .failure(_):
                XCTAssert(false)
            case .success(let result):
                XCTAssertTrue(result.strings == ["1", "2"])
            }
        }
    }

    func test_fetchRandomStrings_failureResponse_resultCorrect() {
        let sut = makeSUT()
        networkProvider.sendRequestCompletionClosure = { target, completion in
            completion(.failure(DummyError()))
        }
        
        sut.fetchRandomStrings(with: 0) { result in
            switch result {
            case .failure(_):
                return
            case .success(_):
                XCTAssert(false)
            }
        }
    }

    private struct DummyError: Error {}
}

private extension RandomStuffServiceTests {
    func makeSUT() -> RandomStuffService {
        let sut = RandomStuffService(provider: networkProvider)
        return sut
    }
}
