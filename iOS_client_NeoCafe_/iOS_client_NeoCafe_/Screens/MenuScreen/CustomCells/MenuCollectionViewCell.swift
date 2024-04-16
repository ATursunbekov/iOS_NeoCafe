//
//  MenuCollectionViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 23/2/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"
    var product: PopularProductModel?

    lazy var productImage = {
        let image = UIImageView(image: UIImage(named: Asset.cupOfCofe.name))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()

    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Карамельный раф"
        label.font = UIFont.poppins(size: 14, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
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
        button.layer.cornerRadius = 14
        return button
    }()

    lazy var customAddButton = CustomAddButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Asset.colorWhite.color
        contentView.layer.cornerRadius = 14
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
        customAddButton.delegate = self
        addButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
    }

    func setupConstraints() {
        contentView.addSubview(productImage)
        contentView.addSubview(name)
        contentView.addSubview(cost)
        contentView.addSubview(addButton)
        contentView.addSubview(customAddButton)

        productImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(110)
        }

        name.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(10)
        }

        cost.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }

        addButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(56)
        }

        customAddButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(32)
            make.width.equalTo(102)
        }

        customAddButton.isHidden = true
    }

    @objc func plusPressed() {
        customAddButton.isHidden = false
        addButton.isHidden = true
        DataManager.shared.addProduct(product: product!)
    }

    func configureData(name: String, cost: Int, url: String, product: PopularProductModel) {
        self.name.text = name
        self.cost.text = "\(cost) c"
        productImage.kf.setImage(with: URL(string: url))
        self.product = product
        setProductAmount()
    }

    func setProductAmount() {
        if let product = product {
            let amount = DataManager.shared.getQuantity(of: product)
            if amount > 0 {
                customAddButton.setAmount(amount)
                customAddButton.isHidden = false
                addButton.isHidden = true
            } else {
                customAddButton.setAmount(1)
                customAddButton.isHidden = true
                addButton.isHidden = false
            }
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuCollectionViewCell: AddButtonDelegate {
    func removePressed() {
        if let product = product {
            DataManager.shared.removeProduct(product: product)
        }
    }

    func addPressed() {
        if let product = product {
            DataManager.shared.addProduct(product: product)
        }
    }

    func removeButton() {
        customAddButton.isHidden = true
        addButton.isHidden = false
        if let product = product {
            DataManager.shared.removeProduct(product: product)
        }
    }
}
