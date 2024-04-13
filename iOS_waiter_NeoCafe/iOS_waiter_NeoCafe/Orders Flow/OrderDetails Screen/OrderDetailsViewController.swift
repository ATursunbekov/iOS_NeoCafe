//
//  OrderDetailsViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

final class OrderDetailsViewController: UIViewController {
    
    var viewModel: OrderDetailsViewModelProtocol
    let contentView = OrderDetailsView()
    
    init(viewModel: OrderDetailsViewModelProtocol) {
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
        tabBarController?.tabBar.isHidden = true
        contentView.orderItemsCollectionView.reloadData()
        configureView(with: viewModel.order)
        updateTotal()
    }
    
    func setupTargets() { 
        contentView.backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
        contentView.closeOrderButton.addTarget(self, action: #selector(closeOrderButtonDidPress), for: .touchUpInside)
        contentView.addSupplementsButton.addTarget(self, action: #selector(addSupplementsButtonDidPress), for: .touchUpInside)
    }
    
    func setupDelegates() { 
        contentView.orderItemsCollectionView.delegate = self
        contentView.orderItemsCollectionView.dataSource = self
    }
    
    @objc func backButtonDidPress() {
        viewModel.onBackNavigate?()
    }
  
    @objc func addSupplementsButtonDidPress() {
        viewModel.onAddSupplementsNavigate?()
    }
    
    @objc func closeOrderButtonDidPress() {
        let order = viewModel.order
        viewModel.onClosingOrderNavigate?(order)
    }

}

// MARK: - Collection View methods
extension OrderDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getOrderProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: OrderItemCell = collectionView.dequeue(for: indexPath)
        
        let data = viewModel.order.products[indexPath.item]
        cell.configureCell(with: data)
        cell.delegate = self
        return cell
    }
}

// MARK: - OrderItemCellDelegate
extension OrderDetailsViewController: OrderItemCellDelegate {
    func isEmpty() {
        viewModel.onRemoveItemFromOrderNavigate?()
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
        contentView.priceLabel.text = "\(totalCost) сом."
    }
    
    func counterValueChanged() {
        updateTotal()
    }
}

extension OrderDetailsViewController {
    func configureView(with data: MockOrder) {
        contentView.topView.topLabel.text = "Стол №\(data.table.number)"
        contentView.idLabel.text = "№ \(data.id)"
        contentView.timeLabel.text = "Открыт в \(data.time)"
        contentView.waiterLabel.text = "Официант: \(data.waiter)"
        contentView.colorCircle.backgroundColor = data.status.color
        contentView.orderStateLabel.text = data.status.rawValue
    }
}


//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct OrderDetailsViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        OrderDetailsViewController(viewModel: OrderDetailsViewModel()).showPreview()
//    }
//}
//#endif
