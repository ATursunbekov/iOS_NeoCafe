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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}

extension OrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orderDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as! BasketTableViewCell
        cell.selectionStyle = .none
        cell.configureData(model: viewModel.orderDetail[indexPath.row])
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
