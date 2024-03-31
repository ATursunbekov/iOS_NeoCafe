//
//  CustomTextField.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

import UIKit
import SnapKit

class CustomTextField: UIView {
    
    lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .colorDarkGray
        return image
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter something"
        textField.font = UIFont.poppins(size: 16, weight: .regular)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.colorDarkGray,
            .font: UIFont.poppins(size: 16, weight: .regular)
        ]
        textField.font = UIFont.poppins(size: 16, weight: .regular)
        textField.attributedPlaceholder = NSAttributedString(string: "Enter email", attributes: attributes)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    required init(placeholder: String, image: String) {
        super.init(frame: CGRect.zero)
        textField.placeholder = placeholder
        logo.image = UIImage(systemName: image)
        backgroundColor = .colorGray
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.colorGray.cgColor
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(logo)
        addSubview(textField)
        
        logo.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(logo.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
