//
//  CustomTextField.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import SnapKit
import UIKit

class CustomTextField: UIView {
    lazy var logo: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.dog.name))
        image.contentMode = .scaleAspectFit
        image.tintColor = Asset.colorDarkBlue.color
        return image
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "EnterSomething"
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Asset.colorDarkGray.color,
            .font: UIFont(name: FontFamily.Poppins.regular.name, size: 16) ?? UIFont.systemFont(ofSize: 16),
        ]
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Enter email", attributes: attributes)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()

    required init(placeholder: String, image: String) {
        super.init(frame: CGRect.zero)
        textField.placeholder = placeholder
        logo.image = UIImage(named: image)
        backgroundColor = Asset.colorGray.color
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = Asset.colorGray.color.cgColor
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(logo)
        addSubview(textField)

        logo.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }

        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(logo.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
