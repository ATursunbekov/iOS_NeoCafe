//
//  ProductCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import SnapKit

// TODO: -
//protocol AddButtonDelegate: AnyObject {
//    func addButtonPressed()
//    func setTotalPrice(_ amount: Int)
//}

class ProductCell: UITableViewCell {
    static let identifier = "ProductCell"
    
    var product: PopularProductModel?
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Карамельный раф"
        label.font = UIFont.poppins(size: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var cost = {
        let label = UILabel()
        label.text = "140 с"
        label.font = UIFont.poppins(size: 16, weight: .regular)
        label.textColor = UIColor.colorLightBlue
        return label
    }()
    
    lazy var addButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.colorPeach
        button.backgroundColor = .colorOrange
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .colorWhite
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
        addButton.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    func setupConstraints() {
        contentView.addSubview(name)
        contentView.addSubview(cost)
        contentView.addSubview(addButton)
                
        name.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(19)
        }
        
        cost.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(name.snp.trailing).offset(10)
            make.height.equalTo(19)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(16)
            make.height.width.equalTo(28)
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
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension ProductCell: AddButtonDelegate {
//    
//    func setTotalPrice(_ amount: Int) {
//        let totalPrice = DataManager.shared.calculateTotalPrice()
//        self.setTotalPrice(totalPrice)
//    }
//    
//    func addButtonPressed() {
//        if let product = product {
//            DataManager.shared.addProduct(product: product)
//        }
//    }
//}
