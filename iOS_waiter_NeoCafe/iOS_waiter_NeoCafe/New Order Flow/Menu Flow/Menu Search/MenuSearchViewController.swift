//
//  MenuSearchViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
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
//        contentView.collectionView.reloadData()
    }
    
    func setupDelegates() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
    
    func setupTargets() {
        contentView.searchBar.exitButton.addTarget(self, action: #selector(exitButtonDidPress), for: .touchUpInside)
        contentView.searchBar.textField.addTarget(self, action: #selector(searchAction), for: .editingChanged)
    }
    
    @objc func searchAction() {
        if let productName = contentView.searchBar.textField.text, productName != "" {
            viewModel.searchProduct(by: productName)
        }
    }
    
    @objc func exitButtonDidPress() {
        viewModel.popScreen?()
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


//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct MenuSearchViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        MenuSearchViewController(viewModel: MenuSearchViewModel()).showPreview()
//    }
//}
//#endif
