//
//  NewOrderInfoDrawerViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

final class NewOrderInfoDrawerViewController: UIViewController {

    var viewModel: NewOrderInfoDrawerViewModelProtocol
    let contentView = NewOrderInfoDrawerView()
    
    private var tapAction: (() -> Void)?
    
    init(viewModel: NewOrderInfoDrawerViewModelProtocol, tapAction: EmptyCompletion? = nil) {
        self.viewModel = viewModel
        self.tapAction = tapAction
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
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupDelegates()
        setupGestures()
        setupTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        contentView.collectionView.reloadData()
        updateTotal()
    }

    func setupDelegates() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
    
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        contentView.backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    func setupTargets() {
        contentView.saveButton.addTarget(self, action: #selector(saveButtonDidPress), for: .touchUpInside)
    }
    
    @objc func saveButtonDidPress() {
        dismiss(animated: false)
        tapAction?()
        viewModel.onOrderPlacementNavigate?()
    }
}

// MARK: - Delegate
extension NewOrderInfoDrawerViewController: OrderItemCellDelegate {
    func isEmpty() {
    }
    
    func getTotal() -> Int {
        return viewModel.getTotalPrice()
    }
    
    func updateTotal() {
        var totalCost = 0
        for product in DataManager.shared.getAllProducts() {
            let subtotal = product.price * DataManager.shared.getQuantity(of: product)
            totalCost += subtotal
        }
        contentView.totalNumberLabel.text = "\(totalCost) сом."
    }
    
    func counterValueChanged() {
        updateTotal()
    }
}

// MARK: - Collection View methods
extension NewOrderInfoDrawerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getOrderProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OrderItemCell = collectionView.dequeue(for: indexPath)
        let products = viewModel.order.products.keys
        guard indexPath.item < products.count else {
            return cell
        }
        let product = Array(products)[indexPath.item]
        cell.configureCell(with: product)
        cell.delegate = self
        return cell
    }
}
