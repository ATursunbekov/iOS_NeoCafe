//
//  MenuCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 09/04/24.
//

import UIKit
import SnapKit

class MenuCell: UICollectionViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.font = UIFont.poppins(ofSize: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var costLabel = {
        let label = UILabel()
        label.text = "140 сом"
        label.font = UIFont.poppins(ofSize: 16, weight: .regular)
        label.textColor = UIColor.colorLightBlue
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .colorWhite
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(costLabel)
                
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(19)
        }
        
        costLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
    }

    func configureCell(with data: MockProduct) {
        self.nameLabel.text = data.name
        self.costLabel.text = "\(data.price) cом"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
