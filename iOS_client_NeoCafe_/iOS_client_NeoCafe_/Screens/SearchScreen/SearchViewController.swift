//
//  SearchViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/2/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModelProtocol
    lazy var searchView = SearchView()
    
    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        viewModel.delegate = self
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
    }
    
    func setupTargets() {
        searchView.searchBar.exitButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        searchView.searchBar.textField.addTarget(self, action: #selector(searchAction), for: .editingChanged)
    }
    
    @objc func searchAction() {
        if let text = searchView.searchBar.textField.text, text != "" {
            viewModel.searchProducts(text: text)
        }
    }
    
    @objc func backPressed() {
        viewModel.popScreen?()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.foundProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        let temp = viewModel.foundProducts[indexPath.row]
        cell.configureData(name: temp.name, description: temp.description, cost: temp.price, image: temp.url, product: temp)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetailScreen?(viewModel.foundProducts[indexPath.row])
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func searchProductResponse() {
        searchView.tableView.reloadData()
    }
}
