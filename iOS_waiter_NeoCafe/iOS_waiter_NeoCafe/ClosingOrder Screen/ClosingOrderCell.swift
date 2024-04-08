//
//  ClosingOrderCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 25/03/24.
//

import UIKit
import SnapKit

class ClosingOrderCell: UICollectionViewCell {
    
    static let identifier = "ClosingOrderCell"
    
    lazy var stackVertical = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    lazy var itemNameCellTitle: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.poppins(size: 16, weight: .medium)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var pricePerItemCellSubtitle: UILabel = {
        let label = UILabel()
        label.text = "(... сум/шт)"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.poppins(size: 16, weight: .medium)
        label.textColor = .colorLightBlue
        return label
    }()
    
    lazy var itemQuantityCellTitle: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.poppins(size: 16, weight: .medium)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var itemSubtotalPriceCellTitle: UILabel = {
        let label = UILabel()
        label.text = "... c"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.poppins(size: 16, weight: .medium)
        label.textColor = .colorDarkBlue
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        contentView.backgroundColor = .white
    }
    
    func setupConstraints() {
        contentView.addSubview(stackVertical)
        stackVertical.addArrangedSubview(itemNameCellTitle)
        stackVertical.addArrangedSubview(pricePerItemCellSubtitle)
        contentView.addSubview(itemQuantityCellTitle)
        contentView.addSubview(itemSubtotalPriceCellTitle)
        
        stackVertical.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
        
        itemQuantityCellTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(stackVertical.snp.trailing).offset(5)
            make.width.equalTo(50)
            make.height.equalTo(22)
        }
        
        itemSubtotalPriceCellTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(itemQuantityCellTitle.snp.trailing).offset(5)
            make.width.equalTo(50)
            make.height.equalTo(22)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ClosingOrderCell {
    func configureCell(with data: ClosingOrderModel) {
        self.itemNameCellTitle.text = data.name
        self.pricePerItemCellSubtitle.text = "(\(String(data.pricePerItem)) сум / шт)"
        self.itemQuantityCellTitle.text = String(data.quantity)
        self.itemSubtotalPriceCellTitle.text = String(data.subtotalPrice)
    }
}



//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct ClosingOrderDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        ClosingOrderDrawerViewController().showPreview()
//    }
//}
//#endif
