//
//  CustomSearchBar.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import SnapKit

class CustomSearchBar: UIView {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.colorDarkGray,
            .font: UIFont.systemFont(ofSize: 15, weight: .regular)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: attributes)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var backgroundView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.backgroundColor = .colorWhite
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.contentMode = .scaleAspectFill
        image.tintColor = .colorWhite
        return image
    }()
    
    lazy var imageView = {
        let view = UIView()
        view.backgroundColor = .colorOrange
        view.layer.cornerRadius = 24
        return view
    }()
    
    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "exit"), for: .normal)
        button.tintColor = .colorDarkGray
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
