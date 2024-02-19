//
//  CustomSearchBar.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 18/2/24.
//

import UIKit
import SnapKit

class CustomSearchBar: UIView {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Asset.colorDarkGray.color,
            .font: UIFont(name: FontFamily.Poppins.regular.name, size: 15) ?? UIFont.systemFont(ofSize: 15)
        ]
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: attributes)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var searchButton = {
        let button = UIButton()
        button.backgroundColor = Asset.colorOrange.color
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.layer.cornerRadius = 24
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 24
        backgroundColor = Asset.colorGray.color
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(textField)
        addSubview(searchButton)
        
        searchButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(48)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalTo(searchButton.snp.leading).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
