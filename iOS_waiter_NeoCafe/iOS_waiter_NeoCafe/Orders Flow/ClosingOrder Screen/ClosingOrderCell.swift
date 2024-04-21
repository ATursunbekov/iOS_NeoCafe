//
//  ClosingOrderCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 25/03/24.
//

import UIKit
import SnapKit

protocol ClosingOrderCellDelegate: AnyObject {
    func isEmptyCheck()
    func getTotal()
}

extension ClosingOrderCellDelegate {
    func isEmptyCheck() {}
    func getTotal() {}
}

class ClosingOrderCell: UICollectionViewCell {
    
    weak var delegate: ClosingOrderCellDelegate?
    
    lazy var stackHorizontal = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()
    
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
        label.font = UIFont.poppins(ofSize: 16, weight: .medium)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var pricePerItemCellSubtitle: UILabel = {
        let label = UILabel()
        label.text = "(... сом / шт)"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.poppins(ofSize: 16, weight: .medium)
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
        label.font = UIFont.poppins(ofSize: 16, weight: .medium)
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
        label.font = UIFont.poppins(ofSize: 16, weight: .medium)
        label.textColor = .colorDarkBlue
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        contentView.backgroundColor = .white
    }
    
    private func setupConstraints() {

        contentView.addSubview(stackHorizontal)
        
        stackHorizontal.addArrangedSubview(stackVertical)
        stackVertical.addArrangedSubview(itemNameCellTitle)
        stackVertical.addArrangedSubview(pricePerItemCellSubtitle)
        
        stackHorizontal.addArrangedSubview(itemQuantityCellTitle)
        stackHorizontal.addArrangedSubview(itemSubtotalPriceCellTitle)
        
        stackHorizontal.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        stackVertical.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        itemQuantityCellTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        itemSubtotalPriceCellTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ClosingOrderCell {
    func configureCell(with data: MockProduct) {
        self.itemNameCellTitle.text = data.name
        self.pricePerItemCellSubtitle.text = "(\(String(data.price)) сом / шт)"
        self.itemQuantityCellTitle.text = String(data.quantity)
        self.itemSubtotalPriceCellTitle.text = String(data.subtotalPrice)
    }
}
