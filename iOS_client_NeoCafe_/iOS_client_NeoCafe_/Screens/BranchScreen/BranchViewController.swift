//
//  BranchViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit

class BranchViewController: UIViewController {
    
    lazy var branchView = BranchScreenView()
    var viewModel: BranchViewModelProtocol
    
    init(viewModel: BranchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        viewModel.getAllBranches()
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
        viewModel.delegate = self
    }
}

extension BranchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.branches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BranchScreenTableViewCell.identifier, for: indexPath) as! BranchScreenTableViewCell
        cell.selectionStyle = .none
        cell.configureData(response: viewModel.branches[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabBarController?.tabBar.isHidden = true
            navigationController?.pushViewController(BranchDetailViewController(viewModel: BranchDetailViewModel(), response: viewModel.branches[indexPath.row]), animated: true)
//        viewModel.navigateToBranchDetail?(viewModel.branches[indexPath.row])
    }
}

extension BranchViewController: BranchViewModelDelegate {
    func getAllBranchesResponse() {
        branchView.tableView.reloadData()
    }
}
