//
//  DetailsOrderViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

class DetailsOrderViewController: UIViewController {
    
    var viewModel: DetailsOrderViewModelProtocol
    let contentView = DetailsOrderView()
    
    init(viewModel: DetailsOrderViewModelProtocol) {
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
    
    func setupTargets() { 
        contentView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        contentView.closeAccountButton.addTarget(self, action: #selector(closeAccountButtonPressed), for: .touchUpInside)
        contentView.addSupplementsButton.addTarget(self, action: #selector(addSupplementsButtonPressed), for: .touchUpInside)
    }
    
    func setupDelegates() { 
        contentView.itemsOrderedCollectionView.delegate = self
        contentView.itemsOrderedCollectionView.dataSource = self
        viewModel.delegate = self
    }
    
    @objc func backButtonPressed() {
        // TODO: -
        viewModel.onBackScreenNavigate?()
    }
  
    @objc func addSupplementsButtonPressed() {
        // TODO: -
        viewModel.onAddSupplementsScreenNavigate?()

//        let coffeeSupplementsDrawerViewController = CoffeeSupplementsDrawerViewController()
//        coffeeSupplementsDrawerViewController.modalPresentationStyle = .overFullScreen
//        present(coffeeSupplementsDrawerViewController, animated: false)
    }
    
    @objc func closeAccountButtonPressed() {
        // TODO: - (([ItemOrderedModel])
        viewModel.onClosingAccountScreenNavigate?([])
        //        let closingOrderDrawerView = ClosingOrderDrawerView()
        //        closingOrderDrawerView.modalPresentationStyle = .overFullScreen
        //        present(closingOrderDrawerView, animated: false)
    }

}

// MARK: - Collection View methods
extension DetailsOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsOrdered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemOrderedCell.identifier, for: indexPath) as! ItemOrderedCell
        let data = viewModel.itemsOrdered[indexPath.item]
        cell.configureCell(with: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - ViewModel Delegate methods
extension DetailsOrderViewController: DetailsOrderDelegate {
    
    func updateScreenWithSuccessfulResponse() {
        // TODO: -
        contentView.itemsOrderedCollectionView.reloadData()
    }
    
    func updateScreenWithFailedResponse() {
//        let errorVC = ErrorViewController()
//        navigationController?.pushViewController(errorVC, animated: true)
    }
}

extension DetailsOrderViewController: CustomCounterDelegate {
    
    func addItemToOrder() {
        <#code#>
    }
    
    func removeItemFromOrder() {
        <#code#>
    }
    
    func minusButton() {
        <#code#>
    }
}
