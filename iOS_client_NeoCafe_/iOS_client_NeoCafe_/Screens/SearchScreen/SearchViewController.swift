//
//  SearchViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/2/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    lazy var searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupTargets()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        view = searchView
    }
    
    func setupDelegates() {
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
    }
    
    func setupTargets() {
        searchView.searchBar.exitButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
