//
//  RandomListViewModel.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation

protocol RandomListViewModelType {
    func viewDidSetup()
}

class RandomListViewModel: RandomListViewModelType {
    weak var view: RandomListViewType!
    var flowController: FlowControllerType!
    var randomStuffService: RandomStuffServiceType!

    func viewDidSetup() {
        loadRandomStrings()
    }

    func loadRandomStrings() {
        randomStuffService.fetchRandomStrings(with: 15) { [weak self] result in
            switch result {
            case .success(let randomStrings):
                self?.view.render(.init(strings: randomStrings.strings))
            case .failure(let error):
                self?.view.showError(with: error.localizedDescription)
            }
        }
    }
}
