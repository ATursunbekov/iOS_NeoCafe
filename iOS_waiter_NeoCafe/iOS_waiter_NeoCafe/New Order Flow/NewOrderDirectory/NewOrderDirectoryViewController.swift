////
////  NewOrderDirectoryViewController.swift
////  iOS_waiter_NeoCafe
////
////  Created by iPak Tulane on 28/03/24.
////
//
//import UIKit
//
//class NewOrderDirectoryViewController: UIViewController {
//    
//    var viewModel: NewOrderDirectoryViewModelProtocol
//    let contentView = NewOrderDirectoryView()
//    
//    init(viewModel: NewOrderDirectoryViewModelProtocol) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func loadView() {
//        view = contentView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTargets()
//        setupDelegates()
//        navigationController?.navigationBar.isHidden = true
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tabBarController?.tabBar.isHidden = false
//    }
//    
//    func setupTargets() {
//        contentView.backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
//        contentView.orderButton.addTarget(self, action: #selector(orderButtonDidPress), for: .touchUpInside)
//    }
//    
//    @objc func backButtonDidPress() {
//    }
//    
//    @objc func orderButtonDidPress() {
//    }
//    
//    func setupDelegates() {
//        contentView.categoriesCollectionView.delegate = self
//        contentView.categoriesCollectionView.dataSource = self
//        
//        contentView.productsCollectionView.delegate = self
//        contentView.productsCollectionView.dataSource = self
//        
//        viewModel.delegate = self
//    }
//    
//}
//
//// MARK: - Collection View methods
//extension NewOrderDirectoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        if collectionView == contentView.categoriesCollectionView {
//            return 2
//        } else if collectionView == contentView.productsCollectionView {
//            return 1
//        } else {
//            return 0
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        if collectionView == contentView.categoriesCollectionView {
//            return viewModel.categories.count
//        } else if collectionView == contentView.productsCollectionView {
//            return viewModel.products.count
//        } else {
//            return 0
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if collectionView == contentView.categoriesCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
//            let data = viewModel.categories[indexPath.item]
//            cell.configureCell(with: data)
//            return cell
//            
//        } else if collectionView == contentView.productsCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
//            
//            let data = viewModel.products[indexPath.item]
//            cell.configureCell(with: data)
//            return cell
//            
//        } else {
//            print("Error: Unknown collection view")
//            return UICollectionViewCell()
//        }
//    }
//}
//
//// MARK: - NewOrderDirectoryDelegate methods
//extension NewOrderDirectoryViewController: NewOrderDirectoryDelegate {
//    func handleSuccessfulResponse() {
//        contentView.productsCollectionView.reloadData()
//    }
//}
