//
//  RandomListViewController.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import UIKit

struct RandomListViewControllerProps {
    let strings: [String]
}

protocol RandomListViewType: class {

    var viewController: UIViewController { get }

    func render(_ props: RandomListViewControllerProps)
    func showError(with description: String)
}

class RandomListViewController: UIViewController {
    var viewModel: RandomListViewModel!
    var props: RandomListViewControllerProps = .init(strings: [])

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidSetup()
    }
}

extension RandomListViewController: RandomListViewType {
    var viewController: UIViewController {
        return self
    }

    func render(_ props: RandomListViewControllerProps) {
        self.props = props
        tableView.reloadData()
    }

    func showError(with description: String) {
    }
}

extension RandomListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return props.strings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = props.strings[indexPath.row]
        return cell
    }
}
