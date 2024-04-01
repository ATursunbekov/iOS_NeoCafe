//
//  BasketViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/2/24.
//

import UIKit
import SwiftUI

class BasketViewController: UIViewController {
    
    lazy var basketView = BasketView()
    
    var viewModel: BasketViewModelProtocol
    
    init(viewModel: BasketViewModelProtocol) {
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
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        basketView.tableView.reloadData()
        isEmptyBasket()
    }
    
    override func loadView() {
        view = basketView
    }
    
    func setupDelegate() {
        basketView.tableView.delegate = self
        basketView.tableView.dataSource = self
        viewModel.delegate = self
    }
    
    func setupTargets() {
        basketView.orderButton.addTarget(self, action: #selector(orderPressed), for: .touchUpInside)
        basketView.historyButton.addTarget(self, action: #selector(orderHistoryPressed), for: .touchUpInside)
    }
    
    func isEmptyBasket() {
        let check = DataManager.shared.getAllProducts().count == 0
        basketView.segmentedController.isHidden = check
        basketView.tableView.isHidden = check
        basketView.orderButton.isHidden = check
        basketView.totalTitle.isHidden = check
        basketView.costLabel.isHidden = check
        basketView.emptyTitle.isHidden = !check
        basketView.emptyStatusImage.isHidden = !check
        basketView.menuButton.isHidden = !check
        if !check {
            var temp = 0
            for i in DataManager.shared.getAllProducts() {
                temp += i.price * DataManager.shared.getQuantity(of: i)
            }
            basketView.costLabel.text = String(temp)
        }
    }
    
    @objc func orderPressed() {
        viewModel.makeOrder()
        let vc = BonusViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    @objc func orderHistoryPressed() {
        navigationController?.pushViewController(OrderHistoryViewController(viewModel: OrderHistoryViewModel()), animated: true)
    }
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.shared.getAllProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as! BasketTableViewCell
        let temp = DataManager.shared.getAllProducts()[indexPath.row]
        cell.configureData(name: temp.name, description: temp.description, cost: temp.price, url: temp.url, product: temp, amount: DataManager.shared.getQuantity(of: temp))
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

extension BasketViewController: BasketTableViewCellDelegate {
    func isEmptyCheck() {
        isEmptyBasket()
    }
    
    func reloadData() {
        basketView.tableView.reloadData()
    }
}

extension BasketViewController: BasketDelegate {
    func clearData() {
        DataManager.shared.productOrders.removeAll()
        basketView.tableView.reloadData()
    }
}
