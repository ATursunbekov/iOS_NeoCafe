//
//  MenuViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/2/24.
//

import UIKit

class MenuViewController: UIViewController {

    let categories = [
        CategoryModel(name: "Кофе", image: Asset.categoryBeanItem.name),
        CategoryModel(name: "Десерты", image: Asset.categoryDesertItem.name),
        CategoryModel(name: "Выпечка", image: Asset.categoryCruasanItem.name),
        CategoryModel(name: "Напитки", image: Asset.categoryDrinkItem.name)
    ]
    
    let menuProducts: [CategoryModel] = [
        CategoryModel(name: "Кофе", image: Asset.cofe.name),
        CategoryModel(name: "Десерты", image: Asset.desert.name),
        CategoryModel(name: "Выпечка", image: Asset.bakering.name),
        CategoryModel(name: "Напитки", image: Asset.drink.name),
        CategoryModel(name: "Чай", image: Asset.tea.name)
    ]
    
    var selectedIndex = 0
    
    lazy var menuView = MenuView()
    
    init(selectedIndex: Int = 0) {
        self.selectedIndex = selectedIndex
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
    }
    
    override func loadView() {
        view = menuView
    }
    
    func setupDelegate() {
        menuView.categoryCollectionView.delegate = self
        menuView.categoryCollectionView.dataSource = self
        menuView.menuCollectionView.delegate = self
        menuView.menuCollectionView.dataSource = self
    }
    
    func setupTargets() {
        menuView.branchButton.addTarget(self, action: #selector(showBranches), for: .touchUpInside)
    }
    
    @objc func showBranches() {
        let branchView = BranchView()
        branchView.modalPresentationStyle = .overFullScreen
        present(branchView, animated: false)
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuView.categoryCollectionView {
            return categories.count
        } else {
            return menuProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuView.categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.configureData(name: categories[indexPath.row].name, image: categories[indexPath.row].image)
            if indexPath.row == selectedIndex {
                cell.selected()
            } else {
                cell.deselect()
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuView.categoryCollectionView {
            let previousSelectedIndexPath = IndexPath(item: selectedIndex, section: 0)
            let cell = menuView.categoryCollectionView.cellForItem(at: previousSelectedIndexPath) as? CategoryCollectionViewCell
            cell?.deselect()
            let chosenCell = menuView.categoryCollectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell
            chosenCell?.selected()
            selectedIndex = indexPath.row
        } else {
            let vc = DetailViewController()
            tabBarController?.tabBar.isHidden = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuView.categoryCollectionView {
            let category = categories[indexPath.item]
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
