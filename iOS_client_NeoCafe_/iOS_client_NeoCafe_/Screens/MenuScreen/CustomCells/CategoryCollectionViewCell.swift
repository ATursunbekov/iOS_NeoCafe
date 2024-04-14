//
//  CategoryCollectionViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/2/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"

    private lazy var customView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        return view
    }()

    private lazy var circleView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = Asset.colorWhite.color
        return view
    }()

    private lazy var logoImage = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = Asset.colorMain.color
        return image
    }()

    private lazy var name = {
        let label = UILabel()
        label.font = .poppins(size: 14, weight: .medium)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    func setupConstraints() {
        contentView.addSubview(customView)
        customView.addSubview(circleView)
        circleView.addSubview(logoImage)
        customView.addSubview(name)

        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        circleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(3)
            make.top.bottom.equalToSuperview().inset(3)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }

        logoImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
        }

        name.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(circleView.snp.trailing).offset(8)
        }
    }

    func configureData(name: String, image: String) {
        self.name.text = name
        logoImage.image = UIImage(named: image)
    }

    func selected() {
        customView.backgroundColor = Asset.colorOrange.color
        circleView.backgroundColor = Asset.colorWhite.color
        name.textColor = Asset.colorWhite.color
        logoImage.tintColor = Asset.colorOrange.color
    }

    func deselect() {
        customView.backgroundColor = Asset.colorGray.color
        circleView.backgroundColor = Asset.colorWhite.color
        name.textColor = .black
        logoImage.tintColor = Asset.colorMain.color
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
