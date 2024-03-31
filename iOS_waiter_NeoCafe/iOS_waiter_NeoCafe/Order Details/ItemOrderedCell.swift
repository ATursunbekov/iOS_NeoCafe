//
//  ItemOrderedCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

class ItemOrderedCell: UICollectionViewCell {
    
    static let identifier = "ItemOrderedCell"
    
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
    
    lazy var counter: CustomCounter = {
        let counter = CustomCounter()
        return counter
    }()
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 14, weight: .bold)
        return label
    }()
    
    lazy var pricePerItemLabel: UILabel = {
        let label = UILabel()
        label.text = "(... сум/шт)"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 14, weight: .bold)
        return label
    }()
    
    lazy var milkSupplementLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 12, weight: .regular)
        return label
    }()

    lazy var syrupSupplementLabel: UILabel = {
        let label = UILabel()
        label.text = "Сироп"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.addSubview(cellView)
        cellView.addSubview(counter)
        cellView.addSubview(itemLabel)
        cellView.addSubview(pricePerItemLabel)
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
        
        itemLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }
        
        pricePerItemLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalTo(itemLabel.snp.trailing).offset(5)
            make.height.equalTo(17)
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

extension ItemOrderedCell {
    func configureCell(with data: ItemOrderedModel) {
        self.itemLabel.text = data.title
        self.pricePerItemLabel.text = String(data.price)
        self.milkSupplementLabel.text = data.milkSupplement
        self.syrupSupplementLabel.text = data.syrupSupplement
        self.counter.counterLabel.text = String(data.quantity)
    }
}
