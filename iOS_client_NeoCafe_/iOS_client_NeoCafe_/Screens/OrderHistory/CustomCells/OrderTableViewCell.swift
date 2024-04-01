//
//  ActiveOrderTableViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    static let identifier = "OrderTableViewCell"
    
    lazy var productImage = {
        let image = UIImageView(image: UIImage(named: Asset.cupOfCofe.name))
        image.contentMode = .scaleAspectFit
        layer.cornerRadius = 12
        return image
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Карамельный раф"
        label.font = UIFont.poppins(size: 14, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var descriptionLabel = {
        let label = UILabel()
        label.text = "Большой, кокосовое молоко"
        label.font = UIFont.poppins(size: 12, weight: .regular)
        label.textColor = Asset.colorDarkBlue.color
        label.numberOfLines = 2
        return label
    }()
    
    lazy var statusLabel = {
        let label = UILabel()
        label.text = "Вчера"
        label.font = UIFont.poppins(size: 14, weight: .medium)
        label.textColor = Asset.colorMain.color
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Asset.colorWhite.color
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
    }
    
    func setupConstraints() {
        contentView.addSubview(productImage)
        contentView.addSubview(name)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(statusLabel)
        
        productImage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(80)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(productImage.snp.trailing).offset(12)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(6)
            make.leading.equalTo(productImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalTo(productImage.snp.trailing).offset(12)
        }
    }
    
    func configureData(order: OrderModel) {
        name.text = order.where
        descriptionLabel.text = order.composition
        statusLabel.text = order.date
    }
    
    func activeStatus() {
        statusLabel.text = "Сейчас"
        statusLabel.textColor = Asset.colorOrange.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
