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

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
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
        detailView.customButton.setAmount(1)
    }

    @objc func backPressed() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func addToBasketPressed() {
        if viewModel.productModel.category == "кофе" {
            let viewController = IngredientViewController { [self] in
                DataManager.shared.addProduct(product: viewModel.productModel, quantity: detailView.customButton.counter)
                self.navigationController?.popToRootViewController(animated: true)
            }
            viewController.modalPresentationStyle = .overFullScreen
            present(viewController, animated: false)
        } else {
            DataManager.shared.addProduct(product: viewModel.productModel, quantity: detailView.customButton.counter)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.popularProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailTableViewCell = tableView.dequeue(for: indexPath)
        cell.selectionStyle = .none
        let temp = viewModel.popularProducts[indexPath.row]
        cell.configureData(name: temp.name, description: temp.description, cost: temp.price, image: temp.url, product: temp)
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetailProductScreen?(viewModel.popularProducts[indexPath.row])
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func fetchRecommendation() {
        detailView.tableView.reloadData()
    }
}

extension DetailViewController: AddButtonDelegate {
    func removePressed() {}

    func addPressed() {}

    func removeButton() {}
}
