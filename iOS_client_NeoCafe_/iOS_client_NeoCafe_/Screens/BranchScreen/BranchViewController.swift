//
//  BranchViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit

class BranchViewController: UIViewController {
    
    lazy var branchView = BranchScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func loadView() {
        view = branchView
    }
    
    func setupDelegate() {
        branchView.tableView.delegate = self
        branchView.tableView.dataSource = self
    }
}

extension BranchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BranchScreenTableViewCell.identifier, for: indexPath) as! BranchScreenTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(BranchDetailViewController(), animated: true)
    }
}
