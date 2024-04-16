//
//  DetailTableViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 24/2/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    static let identifier = "DetailTableViewCell"
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

    lazy var descriptionLabel = {
        let label = UILabel()
        label.text = "Большой, кокосовое молоко"
        label.font = UIFont.poppins(size: 12, weight: .regular)
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
        button.layer.cornerRadius = 20
        return button
    }()

    lazy var customAddButton = CustomAddButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Asset.colorWhite.color
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
        customAddButton.delegate = self
        addButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
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

    func configureData(name: String, description: String, cost: Int, image: String, product: PopularProductModel) {
        self.name.text = name
        descriptionLabel.text = description
        self.cost.text = "\(cost) c"
        productImage.kf.setImage(with: URL(string: image))
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
                descriptionLabel.isHidden = true
            } else {
                customAddButton.setAmount(1)
                customAddButton.isHidden = true
                addButton.isHidden = false
                descriptionLabel.isHidden = false
            }
        }
    }

    @objc func plusPressed() {
        customAddButton.isHidden = false
        addButton.isHidden = true
        descriptionLabel.isHidden = true
        if let product = product {
            DataManager.shared.addProduct(product: product)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailTableViewCell: AddButtonDelegate {
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
        descriptionLabel.isHidden = false
        if let product = product {
            DataManager.shared.removeProduct(product: product)
        }
    }
}
