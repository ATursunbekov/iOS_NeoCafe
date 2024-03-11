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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupTargets()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        basketView.tableView.reloadData()
    }
    
    override func loadView() {
        view = basketView
    }
    
    func setupDelegate() {
        basketView.tableView.delegate = self
        basketView.tableView.dataSource = self
    }
    
    func setupTargets() {
        basketView.orderButton.addTarget(self, action: #selector(orderPressed), for: .touchUpInside)
        basketView.historyButton.addTarget(self, action: #selector(orderHistoryPressed), for: .touchUpInside)
    }
    
    @objc func orderPressed() {
        let vc = BonusViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    @objc func orderHistoryPressed() {
        navigationController?.pushViewController(OrderHistoryViewController(), animated: true)
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
    func reloadData() {
        basketView.tableView.reloadData()
    }
}