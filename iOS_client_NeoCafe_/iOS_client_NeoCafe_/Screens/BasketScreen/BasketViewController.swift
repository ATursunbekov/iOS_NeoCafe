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
    }
    
    @objc func orderPressed() {
        let vc = BonusViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as! BasketTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
