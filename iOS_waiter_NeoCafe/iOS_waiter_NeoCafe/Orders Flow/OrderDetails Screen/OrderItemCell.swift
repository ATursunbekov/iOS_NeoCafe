//
//  OrderItemCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

protocol OrderItemCellDelegate: AnyObject {
    func removeItemFromOrder()
    func getTotal() -> Int
    func updateTotal()
    func counterValueChanged()
}

extension OrderItemCellDelegate {
    func removeItemFromOrder() {}
}

class OrderItemCell: UICollectionViewCell {
    
    var product: MockProduct?
    var quantity: Int = 1
    var total: Int = 0
    weak var delegate: OrderItemCellDelegate?
    
    lazy var cellView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.colorWhite
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    lazy var counter: CircularCounter = {
        let counter = CircularCounter()
        counter.delegate = self
        return counter
    }()
    
    lazy var stackHorizontal = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = UIFont.poppins(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var pricePerItemLabel: UILabel = {
        let label = UILabel()
        label.text = "(100 сом/шт)"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = UIFont.poppins(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var milkSupplementLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = UIFont.poppins(ofSize: 12, weight: .regular)
        return label
    }()

    lazy var syrupSupplementLabel: UILabel = {
        let label = UILabel()
        label.text = "Сироп"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = UIFont.poppins(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.addSubview(cellView)
        cellView.addSubview(counter)
        cellView.addSubview(stackHorizontal)
        stackHorizontal.addArrangedSubview(itemLabel)
        stackHorizontal.addArrangedSubview(pricePerItemLabel)
        cellView.addSubview(milkSupplementLabel)
        cellView.addSubview(syrupSupplementLabel)
        
        cellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        counter.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(22)
            make.width.equalTo(111)
            make.height.equalTo(36)
        }
        
        stackHorizontal.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }

        itemLabel.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
        }
        
        pricePerItemLabel.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
        }
        
        milkSupplementLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(14)
        }
        
        syrupSupplementLabel.snp.makeConstraints { make in
            make.top.equalTo(milkSupplementLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(14)
        }
    }
}

extension OrderItemCell {
    func configureCell(with data: MockProduct) {
        self.itemLabel.text = data.name
        self.pricePerItemLabel.text = "(\(String(data.price)) сом / шт)"
        self.milkSupplementLabel.text = data.supplements?.milk
        self.syrupSupplementLabel.text = data.supplements?.syrup
        self.counter.counterLabel.text = String(data.quantity)
        self.product = data
        self.quantity = data.quantity
        counter.setAmount(quantity)
        
        total = delegate?.getTotal() ?? 0
        delegate?.updateTotal()
    }
}

extension OrderItemCell: CircularCounterDelegate {
    
    func removeItemFromOrder() {
        delegate?.removeItemFromOrder()
    }
    
    func counterValueChanged() {
        delegate?.counterValueChanged()
    }
    
    func addItem() {
        if let product = product {
            DataManager.shared.addProduct(product: product)
        }
        delegate?.updateTotal()
        delegate?.counterValueChanged()
    }
    
    func deductItem() {
        if let product = product {
            DataManager.shared.deductProduct(product: product)
//            DataManager.shared.removeProduct(product: product)
            delegate?.counterValueChanged()
            
            let quantity = DataManager.shared.getQuantity(of: product)
            if quantity == 0 {
//                delegate?.removeItemFromOrder()
                delegate?.counterValueChanged()
            }
        }
        delegate?.updateTotal()
        delegate?.counterValueChanged()
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
