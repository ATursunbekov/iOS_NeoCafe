//
//  NewOrderCoffeeSupplementsDrawerViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

final class NewOrderCoffeeSupplementsDrawerViewController: UIViewController {
    
    var viewModel: NewOrderCoffeeSupplementsDrawerViewModelProtocol
    let contentView = NewOrderCoffeeSupplementsDrawerView()
    
    private var tapAction: (() -> Void)?
    
    init(viewModel: NewOrderCoffeeSupplementsDrawerViewModelProtocol, tapAction: EmptyCompletion? = nil) {
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
        setupGestures()
        setupTargets()
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
//        dismiss(animated: false)
        tapAction?()
        viewModel.popScreen?()
    }
}

extension NewOrderCoffeeSupplementsDrawerViewController: RectangularCounterDelegate {
    
    func removeItem() {
        viewModel.popScreen?()
    }
    
    func addItem() {
        viewModel.updateProductQuantity()
    }
    
    func deductItem() {
        viewModel.updateProductQuantity()
    }
    
    func updateTotal() {
        let totalPrice = viewModel.productTotalPrice
        contentView.totalNumberLabel.text = "\(totalPrice) сом."
    }
}

//extension NewOrderCoffeeSupplementsDrawerViewController: RectangularCounterDelegate {
//    
//    func isEmpty() {
//        delegate?.isEmpty()
//    }
//    
//    func counterValueChanged() {
//        delegate?.counterValueChanged()
//    }
//    
//    func addItem() {
//        if let product = product {
//            DataManager.shared.addProduct(product: product)
//        }
//        delegate?.updateTotal()
//        delegate?.counterValueChanged()
//    }
//    
//    func deductItem() {
//        if let product = product {
//            DataManager.shared.removeProduct(product: product)
//            delegate?.counterValueChanged()
//            
//            let quantity = DataManager.shared.getQuantity(of: product)
//            if quantity == 0 {
//                delegate?.isEmpty()
//                delegate?.counterValueChanged()
//            }
//        }
//        delegate?.updateTotal()
//        delegate?.counterValueChanged()
//    }
//}

// MARK: - Delegate
//extension NewOrderCoffeeSupplementsDrawerViewController: NewOrderCoffeeSupplementsDrawerDelegate {
//    func isEmpty() {
//        viewModel.popScreen?()
//    }
//    
//    func getTotal() -> Int {
//        return viewModel.getTotalPrice()
//    }
//    
//    func updateTotal() {
//        var totalCost = 0
//        for product in DataManager.shared.getAllProducts() {
//            let subtotal = product.price * DataManager.shared.getQuantity(of: product)
//            totalCost += subtotal
//        }
//        contentView.priceLabel.text = "\(totalCost) сом."
//    }
//    
//    func counterValueChanged() {
//        updateTotal()
//    }
//}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct NewOrderCoffeeSupplementsDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        NewOrderCoffeeSupplementsDrawerViewController(viewModel: NewOrderCoffeeSupplementsDrawerViewModel()).showPreview()
//    }
//}
//#endif
