//
//  NotificationViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 5/4/24.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let notView = NotificationView()
    var viewModel: NotificationViewModelProtocol
    
    init(viewModel: NotificationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
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
        viewModel.popBack?()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notificationAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as! NotificationTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}

extension NotificationViewController: NotificationViewModelDelegate {
    func updateData() {
        notView.tableView.reloadData()
    }
}
