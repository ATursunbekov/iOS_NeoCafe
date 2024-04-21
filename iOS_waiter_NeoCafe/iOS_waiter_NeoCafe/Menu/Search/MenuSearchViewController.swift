//
//  MenuSearchViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 16/04/24.
//

import UIKit

final class MenuSearchViewController: UIViewController {
    
    var viewModel: MenuSearchViewModelProtocol
    lazy var contentView = MenuSearchView()
    
    init(viewModel: MenuSearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = contentView
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func setupDelegates() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
    
    func setupTargets() {
        contentView.searchBar.exitButton.addTarget(self, action: #selector(exitButtonDidPress), for: .touchUpInside)
        contentView.searchBar.textField.addTarget(self, action: #selector(searchAction), for: .editingChanged)
    }
    
    @objc func exitButtonDidPress() {
        viewModel.popScreen?()
    }
    
    @objc func searchAction() {
        if let text = contentView.searchBar.textField.text, !text.isEmpty {
            if let foundProduct = viewModel.searchProduct(by: text) {
                print("Found product: \(foundProduct)")
            } else {
                print("Product not found")
            }
            viewModel.searchText = text
        }
        contentView.collectionView.reloadData()
    }
}

// MARK: - Collection View methods
extension MenuSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MenuCell = collectionView.dequeue(for: indexPath)
        
        let data = viewModel.foundProducts[indexPath.item]
        cell.configureCell(with: data)
        return cell
    }
}

// MARK: - MenuSearchViewModelDelegate
extension MenuSearchViewController: MenuSearchViewModelDelegate {
    func reloadData() {
        contentView.collectionView.reloadData()
    }
}
