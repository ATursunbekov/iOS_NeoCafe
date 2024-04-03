//
//  DetailViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 24/2/24.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewModelProtocol
    lazy var detailView = DetailView()
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupDelegate()
        setupTargets()
        configureData()
        viewModel.getPopular()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailView.tableView.reloadData()
    }
    
    override func loadView() {
        view = detailView
    }
    
    func configureData() {
        detailView.productImage.kf.setImage(with: URL(string: viewModel.productModel.url))
        detailView.nameLabel.text = viewModel.productModel.name
        detailView.descriptionLabel.text = viewModel.productModel.description
        detailView.costLabel.text = "\(viewModel.productModel.price) c"
        setProductAmount()
    }
    
    func setupDelegate() {
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
        detailView.customButton.delegate = self
        viewModel.delegate = self
    }
    
    func setupTargets() {
        detailView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        detailView.basketButton.addTarget(self, action: #selector(addToBasketPressed), for: .touchUpInside)
    }
    
    func setProductAmount() {
//        let product = viewModel.productModel
//        let amount = DataManager.shared.getQuantity(of: product)
//        if  amount > 0 {
//            detailView.customButton.setAmount(amount)
//        } else {
//            detailView.customButton.setAmount(0)
//        }
        detailView.customButton.setAmount(1)
    }
    
    @objc func backPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func addToBasketPressed() {
        if viewModel.productModel.category == "кофе" {
            let vc = IngredientViewController { [self] in
                DataManager.shared.addProduct(product: viewModel.productModel, quantity: detailView.customButton.counter)
                self.navigationController?.popToRootViewController(animated: true)
            }
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
        } else {
            DataManager.shared.addProduct(product: viewModel.productModel, quantity: detailView.customButton.counter)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.popularProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        cell.selectionStyle = .none
        let temp = viewModel.popularProducts[indexPath.row]
        cell.configureData(name: temp.name, description: temp.description, cost: temp.price, image: temp.url, product: temp)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetailProductScreen?(viewModel.popularProducts[indexPath.row])
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func fetchRecommendation() {
        detailView.tableView.reloadData()
    }
}

extension DetailViewController: AddButtonDelegate {
    func removePressed() {
//        DataManager.shared.removeProduct(product: viewModel.productModel)
    }
    
    func addPressed() {
//        DataManager.shared.addProduct(product: viewModel.productModel)
    }
    
    func removeButton() {
//        DataManager.shared.removeProduct(product: viewModel.productModel)
    }
}
