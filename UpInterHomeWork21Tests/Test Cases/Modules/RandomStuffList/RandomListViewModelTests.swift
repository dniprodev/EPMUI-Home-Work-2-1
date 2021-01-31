//
//  RandomListViewModelTests.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import XCTest
@testable import UpInterHomeWork21

class RandomListViewModelTests: XCTestCase {
    var view: RandomListViewTypeMock!
    var flowController: FlowControllerTypeMock!
    var randomStuffService: RandomStuffServiceTypeMock!

    override func setUp() {
        view = RandomListViewTypeMock()
        flowController = FlowControllerTypeMock()
        randomStuffService = RandomStuffServiceTypeMock()
    }

    func test_viewDidSetup_dataStartLoading() {
        let sut = makeSUT()

        sut.viewDidSetup()

        XCTAssertTrue(randomStuffService.fetchRandomStringsWithCompletionCallsCount == 1)
    }

    func test_viewDidSetup_dataLoaded_renderCalledWithCorrectParams() {
        let sut = makeSUT()
        randomStuffService.fetchRandomStringsWithCompletionClosure = { count, completion in
            completion(.success(RandomString(strings: ["1", "2"])))
        }

        sut.viewDidSetup()

        XCTAssertTrue(view.renderCalled)
        XCTAssertTrue(view.renderReceivedProps?.strings == ["1", "2"])
    }

    func test_viewDidSetup_dataLoadingFailed_errorShowed() {
        let sut = makeSUT()
        randomStuffService.fetchRandomStringsWithCompletionClosure = { count, completion in
            completion(.failure(DummyError()))
        }

        sut.viewDidSetup()

        XCTAssertTrue(view.showErrorWithCalled)
    }

    private struct DummyError: Error {}
}

private extension RandomListViewModelTests {
    func makeSUT() -> RandomListViewModel {
        let sut = RandomListViewModel()
        sut.flowController = flowController
        sut.view = view
        sut.randomStuffService = randomStuffService
        return sut
    }
}
