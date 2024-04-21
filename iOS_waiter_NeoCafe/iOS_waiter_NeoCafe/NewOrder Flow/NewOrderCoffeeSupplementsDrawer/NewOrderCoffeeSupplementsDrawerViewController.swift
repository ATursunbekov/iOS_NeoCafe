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
