////
////  NewOrderSearchViewController.swift
////  iOS_waiter_NeoCafe
////
////  Created by iPak Tulane on 28/03/24.
////
//
//import UIKit
//
//class NewOrderSearchViewController: UIViewController {
//    
//    var viewModel: NewOrderSearchViewModelProtocol
//    lazy var contentView = NewOrderSearchView()
//    
//    init(viewModel: NewOrderSearchViewModelProtocol) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupDelegates()
//        setupTargets()
//        navigationController?.isNavigationBarHidden = true
//    }
//     
//    override func loadView() {
//        view = contentView
//    }
//    
//    func setupDelegates() {
//        viewModel.delegate = self
//        contentView.tableView.delegate = self
//        contentView.tableView.dataSource = self
//    }
//    
//    func setupTargets() {
//        contentView.searchBar.exitButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
//        contentView.searchBar.textField.addTarget(self, action: #selector(searchAction), for: .editingChanged)
//    }
//    
//    @objc func searchAction() {
//        if let text = contentView.searchBar.textField.text, text != "" {
//            viewModel.searchProducts(text: text)
//        }
//    }
//    
//    @objc func backPressed() {
//        viewModel.popScreen?()
//    }
//}
//
//extension NewOrderSearchViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.foundProducts.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
//        let temp = viewModel.foundProducts[indexPath.row]
//        cell.configureData(name: temp.name, description: temp.description, cost: temp.price, image: temp.url, product: temp)
//        cell.selectionStyle = .none
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.goToDetailScreen?(viewModel.foundProducts[indexPath.row])
//    }
//}
//
//extension NewOrderSearchViewController: NewOrderSearchViewModelDelegate {
//    func searchProductResponse() {
//        contentView.tableView.reloadData()
//    }
//}
