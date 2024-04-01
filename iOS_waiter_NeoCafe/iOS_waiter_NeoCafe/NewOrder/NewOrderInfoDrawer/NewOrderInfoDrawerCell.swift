//
//  NewOrderInfoDrawerCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit

//protocol AddButtonDelegate: AnyObject {
//    func addButtonPressed()
//    func setTotalPrice(_ amount: Int)
//}

class NewOrderInfoDrawerCell: UITableViewCell {
    static let identifier = "NewOrderInfoDrawerCell"
    
    var product: PopularProductModel?
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "*Карамельный раф"
        label.font = UIFont.poppins(size: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var cost = {
        let label = UILabel()
        label.text = "*140 с"
        label.font = UIFont.poppins(size: 16, weight: .regular)
        label.textColor = UIColor.colorLightBlue
        return label
    }()
    
    lazy var milkSupplementLabel = {
        let label = UILabel()
        label.text = "*Коровье молоко"
        label.textAlignment = .left
        label.font = UIFont.poppins(size: 12, weight: .regular)
        label.textColor = UIColor.colorLightBlue
        return label
    }()

    lazy var syrupSupplementLabel = {
        let label = UILabel()
        label.text = "*Карамельный сироп"
        label.textAlignment = .left
        label.font = UIFont.poppins(size: 12, weight: .regular)
        label.textColor = UIColor.colorLightBlue
        return label
    }()
    
    lazy var circularCounter = CircularCounter()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .colorWhite
        contentView.layer.cornerRadius = 12
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    func setupConstraints() {
        contentView.addSubview(name)
        contentView.addSubview(cost)
        contentView.addSubview(milkSupplementLabel)
        contentView.addSubview(syrupSupplementLabel)
        contentView.addSubview(circularCounter)
                
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }
        
        cost.snp.makeConstraints { make in
            make.centerY.equalTo(name.snp.centerY)
            make.leading.equalTo(name.snp.trailing).offset(10)
            make.height.equalTo(17)
        }
        
        circularCounter.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(111)
            make.height.equalTo(36)
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
    
    func configureData(name: String, cost: Int, product: PopularProductModel) {
        self.name.text = name
        self.cost.text = "\(cost) c"
        self.product = product
//        setOrderTotalAmount()
    }
    
//    func setProductAmount() {
//        if let product = product {
//            let amount = DataManager.shared.getQuantity(of: product)
//            if  amount > 0 {
////                customAddButton.setAmount(amount)
////                customAddButton.isHidden = false
//                addButton.isHidden = true
//                descriptionLabel.isHidden = true
//            } else {
////                customAddButton.setAmount(1)
////                customAddButton.isHidden = true
//                addButton.isHidden = false
////                descriptionLabel.isHidden = false
//            }
//        }
//    }
    
    
    // TODO: -
//    var totalPrice = 1
//    func setTotalPrice(_ amount: Int) {
//        orderTotalAmountLabel.text = String(amount)
//        totalPrice = amount
//    }
//
//    func setOrderTotalAmount() {
//        let totalPrice = DataManager.shared.calculateTotalPrice()
//        delegate.setTotalPrice(totalPrice)
//    }
    
//    func setOrderTotalAmount() {
//        if let product = product {
//            let totalPrice = DataManager.shared.getProductsTotalPrice(of: product)
//            if  amount > 0 {
//                delegate.setAmount(totalPrice)
//            } else {
//                delegate.setAmount(1)
//            }
//        }
//    }
    
        
    @objc func addButtonDidPress() {
        addButton.isHidden = false
//        if let product = product {
//            DataManager.shared.addProduct(product: product)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension NewOrderInfoDrawerCell: AddButtonDelegate {
//    func addButtonPressed() {
//        if let product = product {
//            DataManager.shared.addProduct(product: product)
//        }
//    }
//}
