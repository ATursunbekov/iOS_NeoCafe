//
//  MenuViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 10/04/24.
//

import UIKit

final class MenuViewController: UIViewController {
    
    var viewModel: MenuViewModelProtocol
    let contentView = MenuView()
    
    init(viewModel: MenuViewModelProtocol) {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        contentView.categoriesCollectionView.reloadData()
        contentView.productsCollectionView.reloadData()
    }
    
    func setupTargets() {
        contentView.profileButton.addTarget(self, action: #selector(profileButtonDidPress), for: .touchUpInside)
        contentView.noticeButton.addTarget(self, action: #selector(noticeButtonDidPress), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarDidPress))
        contentView.searchBar.addGestureRecognizer(tapGesture)
    }
    
    @objc func profileButtonDidPress() {
        viewModel.onProfileNavigate?()
    }
    
    @objc func noticeButtonDidPress() {
        viewModel.onNoticeNavigate?()
    }
    
    @objc func searchBarDidPress() {
        viewModel.onMenuSearchNavigate?()
    }
    
    func setupDelegates() {
        contentView.categoriesCollectionView.delegate = self
        contentView.categoriesCollectionView.dataSource = self
        
        contentView.productsCollectionView.delegate = self
        contentView.productsCollectionView.dataSource = self
    }
    
}

// MARK: - Collection View methods
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            
            let cell: MenuCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.filteredProducts[indexPath.item]
            cell.configureCell(with: data)
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
            
            // Store the index of the previously selected cell
            let previousSelectedIndex = viewModel.categorySelectedIndex
            
            // Update the selected index
            viewModel.changeSelectedIndex(with: indexPath.item)
            
            // If the previous index is valid, deselect the previous cell
            if let previousCell = collectionView.cellForItem(at: IndexPath(item: previousSelectedIndex, section: 0)) as? CategoryCell {
                previousCell.deselected()
            }
            
            // Select the newly selected cell
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
                selectedCell.selected()
            }
            
            contentView.productsCollectionView.reloadData()
        }
    }
}


//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct MenuViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        MenuViewController(viewModel: MenuViewModel()).showPreview()
//    }
//}
//#endif
