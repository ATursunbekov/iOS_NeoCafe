//
//  ProfileViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 1/3/24.
//

import SwiftUI
import UIKit

class ProfileViewController: UIViewController {
    lazy var profileView = ProfileView()
    var viewModel: ProfileViewModelProtocol

    init(viewModel: ProfileViewModelProtocol) {
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
        viewModel.getProfileData()
        viewModel.getOrderHistory()
        navigationController?.isNavigationBarHidden = true
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
        profileView.exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        profileView.bonusView.addGestureRecognizer(tapGesture)
        profileView.editButton.addTarget(self, action: #selector(editPressed), for: .touchUpInside)
    }

    @objc func exitPressed() {
        viewModel.logOut?()
        tabBarController?.tabBar.isHidden = true
    }

    @objc func editPressed() {
        navigationController?.pushViewController(EditProfileViewController(viewModel: EditProfileViewModel()), animated: true)
    }

    @objc func viewTapped() {
        let viewController = ProfileBonusView()
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: false)
    }

    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
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
        label.text = section == 0 ? Str.currentOrder : Str.finishedOrder
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

extension ProfileViewController: ProfileViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.profileView.tableView.reloadData()
        }
    }

    func updateData(fetchedData: ProfileModel) {
        profileView.userName.text = fetchedData.email
        profileView.bonusAmount.text = fetchedData.bonus
    }
}
