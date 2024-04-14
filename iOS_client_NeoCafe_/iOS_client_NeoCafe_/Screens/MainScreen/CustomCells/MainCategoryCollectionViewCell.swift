//
//  MainCategoryCollectionViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/2/24.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCategoryCollectionViewCell"

    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var titleLable = {
        let label = UILabel()
        label.font = UIFont.poppins(size: 14, weight: .bold)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorYellow.color
        layer.cornerRadius = 14
        setupConstraints()
    }

    func setupConstraints() {
        contentView.addSubview(logoImage)
        contentView.addSubview(titleLable)

        logoImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-8)
            make.centerX.equalToSuperview()
            make.height.equalTo(56.6)
            make.width.equalTo(56)
        }

        titleLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(8)
        }
    }

    func configureData(name: String, image: String) {
        logoImage.image = UIImage(named: image)
        titleLable.text = name
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
