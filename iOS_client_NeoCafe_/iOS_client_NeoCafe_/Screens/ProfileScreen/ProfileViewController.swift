//
//  ProfileViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 1/3/24.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    
    lazy var profileView = ProfileView()
    var viewModel: ProfileViewModelProtocol
    
    init(viewModel: ProfileViewModelProtocol) {
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
        viewModel.getProfileData()
    }
    
    override func loadView() {
        view = profileView
    }
    
    func setupDelegate() {
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
        viewModel.delegate = self
    }
    
    func setupTargets() {
//        profileView.exitButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        profileView.bonusView.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped() {
        let vc = ProfileBonusView()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
            cell.activeStatus()
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let label = UILabel()
        label.text = section == 0 ? "Актуальный заказ" : "Завершенные"
        label.font = .poppins(size: 16, weight: .bold)
        label.frame = CGRect(x: 15, y: 5, width: tableView.bounds.size.width - 30, height: 30)
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(OrderDetailViewController(), animated: true)
    }
}

extension ProfileViewController: ProfileViewModelDelegate {
    func updateData(fetchedData: ProfileModel) {
        profileView.userName.text = fetchedData.email
        profileView.bonusAmount.text = fetchedData.bonus
    }
}
