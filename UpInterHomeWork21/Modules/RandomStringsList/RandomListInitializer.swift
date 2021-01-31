//
//  RandomListInitializer.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import UIKit

struct RandomListInitializer {
    static func intialize() -> RandomListViewType {
        guard let view = UIStoryboard(name: "RandomList", bundle: nil)
                .instantiateViewController(withIdentifier: "RandomListViewController") as? RandomListViewController else {
            fatalError("LoginViewController is not of the expected class LoginViewController.")
        }

        let viewModel = RandomListViewModel()
        viewModel.randomStuffService = RandomStuffService(provider: NetworkProvider())
        viewModel.view = view
        viewModel.flowController = FlowController()

        view.viewModel = viewModel

        return view
    }
}
