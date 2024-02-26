//
//  MainMenuCollectionViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/2/24.
//

import UIKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainMenuCollectionViewCell"
    
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
    
    lazy var cost = {
        let label = UILabel()
        label.text = "270 с"
        label.font = UIFont.poppins(size: 14, weight: .bold)
        label.textColor = Asset.colorOrange.color
        return label
    }()
    
    lazy var addButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = Asset.colorTitle.color
        button.backgroundColor = Asset.colorOrange.color
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var customAddButton = CustomAddButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Asset.colorWhite.color
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 8)
        contentView.layer.shadowRadius = 8
        contentView.layer.shadowOpacity = 0.08
        setupConstraints()
        customAddButton.delegate = self
        addButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
    }
    
    func setupConstraints() {
        contentView.addSubview(productImage)
        contentView.addSubview(name)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(cost)
        contentView.addSubview(addButton)
        contentView.addSubview(customAddButton)
        
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
        
        cost.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.leading.equalTo(productImage.snp.trailing).offset(12)
        }
        
        addButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(56)
        }
        
        customAddButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
            make.height.equalTo(32)
            make.width.equalTo(102)
        }
        
        customAddButton.isHidden = true
    }
    
    @objc func plusPressed() {
        customAddButton.isHidden = false
        addButton.isHidden = true
        descriptionLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainMenuCollectionViewCell: AddButtonDelegate {
    func removeButton() {
        customAddButton.isHidden = true
        addButton.isHidden = false
        descriptionLabel.isHidden = false
    }
}
