//
//  CustomSearchBar.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/2/24.
//

import SnapKit
import UIKit

class CustomSearchBar: UIView {
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Asset.colorDarkGray.color,
            .font: UIFont(name: FontFamily.Poppins.regular.name, size: 15) ?? UIFont.systemFont(ofSize: 15),
        ]
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: Str.searchPlaceholder, attributes: attributes)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()

    lazy var backgroundView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.backgroundColor = Asset.colorWhite.color
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        return view
    }()

    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.contentMode = .scaleAspectFill
        image.tintColor = Asset.colorWhite.color
        return image
    }()

    lazy var imageView = {
        let view = UIView()
        view.backgroundColor = Asset.colorOrange.color
        view.layer.cornerRadius = 24
        return view
    }()

    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.exit.name), for: .normal)
        button.tintColor = Asset.colorDarkGray.color
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(backgroundView)
        backgroundView.addSubview(imageView)
        imageView.addSubview(logoImage)
        backgroundView.addSubview(textField)
        backgroundView.addSubview(exitButton)

        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(48)
        }

        logoImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(24)
        }

        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalTo(exitButton.snp.leading).offset(-10)
        }

        exitButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
