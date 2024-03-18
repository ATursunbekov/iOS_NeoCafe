//
//  OrderDetailViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    lazy var orderView = OrderDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupTargets()
    }
    
    override func loadView() {
        view = orderView
    }
    
    func setupDelegate() {
        orderView.tableView.delegate = self
        orderView.tableView.dataSource = self
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as! BasketTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
