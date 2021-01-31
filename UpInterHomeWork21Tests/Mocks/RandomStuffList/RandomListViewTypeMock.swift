//
//  RandomListViewTypeMock.swift
//  UpInterHomeWork21Tests
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import UIKit
@testable import UpInterHomeWork21

class RandomListViewTypeMock: RandomListViewType {
    var viewController: UIViewController {
        get { return underlyingViewController }
        set(value) { underlyingViewController = value }
    }
    var underlyingViewController: UIViewController!

    //MARK: - render

    var renderCallsCount = 0
    var renderCalled: Bool {
        return renderCallsCount > 0
    }
    var renderReceivedProps: RandomListViewControllerProps?
    var renderClosure: ((RandomListViewControllerProps) -> Void)?

    func render(_ props: RandomListViewControllerProps) {
        renderCallsCount += 1
        renderReceivedProps = props
        renderClosure?(props)
    }

    //MARK: - showError

    var showErrorWithCallsCount = 0
    var showErrorWithCalled: Bool {
        return showErrorWithCallsCount > 0
    }
    var showErrorWithReceivedDescription: String?
    var showErrorWithClosure: ((String) -> Void)?

    func showError(with description: String) {
        showErrorWithCallsCount += 1
        showErrorWithReceivedDescription = description
        showErrorWithClosure?(description)
    }

}
