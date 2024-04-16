//
//  ClosingOrderHeader.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 25/03/24.
//

import UIKit
import SnapKit

class ClosingOrderHeader: UICollectionReusableView {
    
    static let identifier = "ClosingOrderHeader"
    
    lazy var itemNameHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "Наименование"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.poppins(size: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var itemQuantityHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "Кол-во"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.poppins(size: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var itemSubtotalPriceHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "Сумма"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.poppins(size: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    func setupConstraints() {
        addSubview(itemNameHeaderTitle)
        addSubview(itemQuantityHeaderTitle)
        addSubview(itemSubtotalPriceHeaderTitle)
        
        itemNameHeaderTitle.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(15)
        }
        
        itemQuantityHeaderTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(itemNameHeaderTitle.snp.trailing).offset(5)
            make.width.equalTo(50)
            make.height.equalTo(15)
        }
        
        itemSubtotalPriceHeaderTitle.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.leading.equalTo(itemQuantityHeaderTitle.snp.trailing).offset(5)
            make.height.equalTo(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
