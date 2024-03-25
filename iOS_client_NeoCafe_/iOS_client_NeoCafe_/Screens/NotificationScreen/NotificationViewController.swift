//
//  NotificationViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let notView = NotificationView()
    var viewModel: NotificationViewModelProtocol?
    
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
    }
    
    func setupDelegates() {
        notView.tableView.delegate = self
        notView.tableView.dataSource = self
        viewModel?.delegate = self
    }
    
    override func loadView() {
        view = notView
    }
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as! NotificationTableViewCell
        return cell
    }
}

extension NotificationViewController: NotificationViewModelDelegate {
    func updateData() {
        notView.tableView.reloadData()
    }
}
