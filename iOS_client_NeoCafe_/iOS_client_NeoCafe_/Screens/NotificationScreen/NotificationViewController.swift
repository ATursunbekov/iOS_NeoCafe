//
//  NotificationViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import UIKit

class NotificationViewController: UIViewController {
    let notView = NotificationView()
    var viewModel: NotificationViewModelProtocol

    init(viewModel: NotificationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        navigationController?.isNavigationBarHidden = true
        setupTargets()
    }

    func setupDelegates() {
        notView.tableView.delegate = self
        notView.tableView.dataSource = self
        viewModel.delegate = self
    }

    func setupTargets() {
        notView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        notView.clearButton.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
    }

    @objc func backPressed() {
        viewModel.popScreen?()
    }

    @objc func clearPressed() {
        viewModel.notificationAmount = 0
        notView.tableView.reloadData()
    }

    override func loadView() {
        view = notView
    }
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.notificationAmount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as! NotificationTableViewCell
        let cell: NotificationTableViewCell = tableView.dequeue(for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

extension NotificationViewController: NotificationViewModelDelegate {
    func updateData() {
        notView.tableView.reloadData()
    }
}
