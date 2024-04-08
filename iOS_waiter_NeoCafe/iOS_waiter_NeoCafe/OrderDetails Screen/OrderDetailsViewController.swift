//
//  OrderDetailsViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

class OrderDetailsViewController: UIViewController {
    
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
        contentView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        contentView.closeOrderButton.addTarget(self, action: #selector(closeOrderButtonPressed), for: .touchUpInside)
        contentView.addSupplementsButton.addTarget(self, action: #selector(addSupplementsButtonPressed), for: .touchUpInside)
    }
    
    func setupDelegates() { 
        contentView.orderItemsCollectionView.delegate = self
        contentView.orderItemsCollectionView.dataSource = self
    }
    
    @objc func backButtonPressed() {
        viewModel.onBackNavigate?()
    }
  
    @objc func addSupplementsButtonPressed() {
        viewModel.onAddSupplementsNavigate?()
    }
    
    @objc func closeOrderButtonPressed() {
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
        return viewModel.order.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderItemCell.identifier, for: indexPath) as! OrderItemCell
        let data = viewModel.order.products[indexPath.item]
        cell.configureCell(with: data)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO:
    }
}

// MARK: - OrderItemCellDelegate
extension OrderDetailsViewController: OrderItemCellDelegate {
    func isEmptyCheck() {
        viewModel.onRemoveItemFromOrderNavigate?()
    }
    
    func getTotal() -> Int {
        return viewModel.getTotalPrice()
    }
    
//    func updateTotal() {
//        var totalPrice = 0
//        for product in viewModel.order.products {
//            totalPrice += product.price * product.quantity
//        }
//        viewModel.orderTotalPrice = totalPrice
//    }
    
    func updateTotal() {
//        let viewModel.getTotalPrice()
        _ = viewModel.getTotalPrice()
//        contentView.priceLabel.text = "\(totalPrice) сом."
        contentView.priceLabel.text = "\(viewModel.orderTotalPrice) сом."
    }
//    private func updateTotalPrice() {
//        let totalPrice = viewModel.order.products.reduce(0) { $0 + $1.subtotalPrice }
//        contentView.priceLabel.text = "\(totalPrice) сом."
//    }
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
