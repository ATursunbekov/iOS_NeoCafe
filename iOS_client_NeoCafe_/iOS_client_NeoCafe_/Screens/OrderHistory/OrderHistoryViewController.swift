//
//  OrderHistoryViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 27/2/24.
//

import SwiftUI
import UIKit

class OrderHistoryViewController: UIViewController {
    lazy var orderView = OrderHistoryView()
    var viewModel: OrderHistoryViewModelProtocol

    init(viewModel: OrderHistoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupTargets()
        viewModel.getOrderHistory()
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
}

extension OrderHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        2
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.activeOrders.count
        } else {
            return viewModel.doneOrders.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: OrderTableViewCell = tableView.dequeue(for: indexPath)
            cell.activeStatus()
            cell.selectionStyle = .none
            cell.configureData(order: viewModel.activeOrders[indexPath.row])
            return cell
        } else {
            let cell: OrderTableViewCell = tableView.dequeue(for: indexPath)
            cell.selectionStyle = .none
            cell.configureData(order: viewModel.doneOrders[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white

        let label = UILabel()
        label.text = section == 0 ? "Открытый заказ" : "Завершенные"
        label.font = .poppins(size: 16, weight: .bold)
        label.frame = CGRect(x: 15, y: 5, width: tableView.bounds.size.width - 30, height: 30)
        headerView.addSubview(label)

        return headerView
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 40
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(OrderDetailViewController(viewModel: OrderHistoryDetailViewModel(id: viewModel.activeOrders[indexPath.row].id)), animated: true)
        } else {
            navigationController?.pushViewController(OrderDetailViewController(viewModel: OrderHistoryDetailViewModel(id: viewModel.doneOrders[indexPath.row].id)), animated: true)
        }
    }
}

extension OrderHistoryViewController: OrderHistoryDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.orderView.tableView.reloadData()
        }
    }
}
