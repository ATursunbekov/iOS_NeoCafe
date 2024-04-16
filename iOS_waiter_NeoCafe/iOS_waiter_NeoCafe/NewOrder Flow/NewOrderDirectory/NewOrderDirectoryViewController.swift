//
//  NewOrderDirectoryViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit

final class NewOrderDirectoryViewController: UIViewController {
    
    var viewModel: NewOrderDirectoryViewModelProtocol
    let contentView = NewOrderDirectoryView()
    
    init(viewModel: NewOrderDirectoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        setupDelegates()
        navigationController?.navigationBar.isHidden = true
        hidesBottomBarWhenPushed = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        contentView.categoriesCollectionView.reloadData()
        contentView.productsCollectionView.reloadData()
    }
    
    func setupTargets() {
        contentView.backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
        contentView.orderButton.addTarget(self, action: #selector(orderButtonDidPress), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarDidPress))
        contentView.searchBar.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonDidPress() {
        viewModel.onBackNavigate?()
    }
    
    @objc func searchBarDidPress() {
        viewModel.onNewOrderSearchNavigate?()
    }
    
    @objc func orderButtonDidPress() {
        let order = viewModel.order
        viewModel.onNewOrderInfoDrawerNavigate?(order)
    }
    
    func setupDelegates() {
        contentView.categoriesCollectionView.delegate = self
        contentView.categoriesCollectionView.dataSource = self
        
        contentView.productsCollectionView.delegate = self
        contentView.productsCollectionView.dataSource = self
    }
    
}

// MARK: - Collection View methods
extension NewOrderDirectoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == contentView.categoriesCollectionView {
            return 1
        } else if collectionView == contentView.productsCollectionView {
            return 1
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.categoriesCollectionView {
            return viewModel.getCategoriesCount()
        } else if collectionView == contentView.productsCollectionView {
            return viewModel.getProductsCount()
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == contentView.categoriesCollectionView {
            
            let cell: CategoryCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.categories[indexPath.item]
            cell.configureCell(with: data)
            
            if indexPath.item == viewModel.categorySelectedIndex {
                cell.selected()
            } else {
                cell.deselected()
            }
            return cell
            
        } else if collectionView == contentView.productsCollectionView {
            
            let cell: ProductCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.filteredProducts[indexPath.item]
            cell.configureCell(with: data)
            cell.delegate = self
            return cell
            
        } else {
            print("Error: Unknown collection view")
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contentView.categoriesCollectionView {
            
            guard indexPath.item < viewModel.getCategoriesCount() else {
                return
            }
            
            let previousSelectedIndex = viewModel.categorySelectedIndex

            viewModel.changeSelectedIndex(with: indexPath.item)
            
            if let previousCell = collectionView.cellForItem(at: IndexPath(item: previousSelectedIndex, section: 0)) as? CategoryCell {
                previousCell.deselected()
            }
            
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
                selectedCell.selected()
            }
            
            contentView.productsCollectionView.reloadData()
            
        } else if collectionView == contentView.productsCollectionView {
            DispatchQueue.main.async {
                self.contentView.configureOrderButton(isEnabled: true)
                self.viewModel.addProductToOrder(product: self.viewModel.allProducts[indexPath.item])
                let orderTotalAmount = self.viewModel.getOrderTotalAmount()
                self.contentView.orderTotalAmountLabel.text = "\(orderTotalAmount) сом"
            }
        }
    }
}

extension NewOrderDirectoryViewController: ProductCellDelegate {
    
    func enableOrderButton() {
        contentView.configureOrderButton(isEnabled: true)
    }
    
    func updateOrderButtonTotal() {
        let selectedProduct = viewModel.filteredProducts[viewModel.productSelectedIndex]
        viewModel.addProductToOrder(product: selectedProduct)
        let total = viewModel.getOrderTotalAmount()
        DispatchQueue.main.async {
            self.contentView.orderTotalAmountLabel.text = "\(total) сом."
        }
    }
}
