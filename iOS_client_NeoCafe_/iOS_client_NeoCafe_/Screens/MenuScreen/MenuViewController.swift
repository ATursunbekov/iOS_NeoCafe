//
//  MenuViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/2/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    var viewModel: MenuViewModelProtocol
    
    lazy var menuView = MenuView()
    
    init(viewModel: MenuViewModelProtocol = MenuViewModel(selectedIndex: 0)) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        navigationController?.isNavigationBarHidden = true
        setupTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        menuView.menuCollectionView.reloadData()
    }
    
    override func loadView() {
        view = menuView
    }
    
    func setupDelegate() {
        viewModel.delegate = self
        menuView.categoryCollectionView.delegate = self
        menuView.categoryCollectionView.dataSource = self
        menuView.menuCollectionView.delegate = self
        menuView.menuCollectionView.dataSource = self
    }
    
    func setupTargets() {
        menuView.branchButton.addTarget(self, action: #selector(showBranches), for: .touchUpInside)
    }
    
    @objc func showBranches() {
        let branchView = BranchView(viewModel: BranchViewModel())
        branchView.delegate = self
        branchView.modalPresentationStyle = .overFullScreen
        present(branchView, animated: false)
    }
    
    func getCategoryName(index: Int) -> String {
        switch index {
        case 0:
            return "кофе"
        case 1:
            return "десерты"
        case 2:
            return "выпечка"
        case 3:
            return "напитки"
        default:
            return "чай"
        }
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuView.categoryCollectionView {
            return viewModel.categories.count
        } else {
            return viewModel.categoryProduct.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuView.categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.configureData(name: viewModel.categories[indexPath.row].name, image: viewModel.categories[indexPath.row].image)
            if indexPath.row == viewModel.selectedIndex {
                cell.selected()
                viewModel.getCategoryProducts(category: getCategoryName(index: indexPath.row))
            } else {
                cell.deselect()
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            let temp = viewModel.categoryProduct[indexPath.row]
            cell.configureData(name: temp.name, cost: temp.price, url: temp.url, product: temp)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuView.categoryCollectionView {
            let previousSelectedIndexPath = IndexPath(item: viewModel.selectedIndex, section: 0)
            let cell = menuView.categoryCollectionView.cellForItem(at: previousSelectedIndexPath) as? CategoryCollectionViewCell
            cell?.deselect()
            let chosenCell = menuView.categoryCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell
            chosenCell?.selected()
            viewModel.selectedIndex = indexPath.row
            viewModel.getCategoryProducts(category: getCategoryName(index: indexPath.row))
        } else {
            viewModel.goToDetailProductScreen?(viewModel.categoryProduct[indexPath.row])
        }
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuView.categoryCollectionView {
            let category = viewModel.categories[indexPath.item]
            let name = category.name
            let imageWidth: CGFloat = 20
            
            let nameWidth = name.size(withAttributes: [NSAttributedString.Key.font: UIFont.poppins(size: 14, weight: .medium)]).width
            let cellWidth = imageWidth + nameWidth + 33
            
            return CGSize(width: cellWidth, height: collectionView.bounds.height)
        } else {
            return CGSize(width: 166, height: 207)
        }
    }
}

extension MenuViewController: MenuViewModelDelegate {
    func getCategoryObjects() {
        menuView.menuCollectionView.reloadData()
    }
}

extension MenuViewController: BranchViewNameDelegate {
    func updateName(_ name: String) {
        menuView.placeName.text = name
    }
}
