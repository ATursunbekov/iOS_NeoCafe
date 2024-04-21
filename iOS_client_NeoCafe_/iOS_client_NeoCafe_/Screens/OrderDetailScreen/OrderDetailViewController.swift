//
//  OrderDetailViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit

class OrderDetailViewController: UIViewController {
    lazy var orderView = OrderDetailView()
    var viewModel: OrderHistoryDetailViewModelProtocol

    init(viewModel: OrderHistoryDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupTargets()
        viewModel.getOrderHistoryDetail()
        navigationController?.isNavigationBarHidden = true
    }

    override func loadView() {
        view = orderView
    }

    func setupDelegate() {
        orderView.tableView.delegate = self
        orderView.tableView.dataSource = self
        viewModel.delegate = self
    }

    func setupTargets() {
        orderView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }

    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasketTableViewCell = tableView.dequeue(for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

extension OrderDetailViewController: OrderHistoryDetailDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.orderView.tableView.reloadData()
        }
    }
}
