//
//  BasketTableViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/2/24.
//

import UIKit

protocol BasketTableViewCellDelegate: AnyObject {
    func reloadData()
    func isEmptyCheck()
}

class BasketTableViewCell: UITableViewCell {
    static let identifier = "BasketTableViewCell"
    var product: PopularProductModel?
    var amount: Int = 1
    var delegate: BasketTableViewCellDelegate?

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

    lazy var customAddButton = CustomAddButton(buttonSize: 28)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Asset.colorWhite.color
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
        customAddButton.delegate = self
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
    }

    func setupConstraints() {
        contentView.addSubview(productImage)
        contentView.addSubview(name)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(cost)
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
            //            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalTo(productImage.snp.trailing).offset(12)
        }

        customAddButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalTo(-12)
            make.height.equalTo(28)
            make.width.equalTo(94)
        }
    }

    func configureData(name: String, description: String, cost: Int, url: String, product: PopularProductModel, amount: Int) {
        self.name.text = name
        descriptionLabel.text = description
        self.cost.text = "\(cost) c"
        productImage.kf.setImage(with: URL(string: url))
        self.product = product
        customAddButton.setAmount(amount)
    }

    func configureData(model: OrderHistoryDetailModel) {
        name.text = model.name
        descriptionLabel.text = ""
        cost.text = "\(model.price) c"
        productImage.kf.setImage(with: URL(string: model.imageUrl))
        customAddButton.setAmount(model.quantity)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BasketTableViewCell: AddButtonDelegate {
    func isEmptyCheck() {
        delegate?.isEmptyCheck()
    }

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
        if let product = product {
            DataManager.shared.removeProduct(product: product)
        }
        delegate?.reloadData()
    }
}
