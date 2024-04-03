//
//  EditProfileView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/3/24.
//

import UIKit

class EditProfileView: UIView {
    
    lazy var topView = TopView()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.arrowBack.name), for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Редактирование"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var textField = CustomTextField(placeholder: Str.enterEmail, image: Asset.dog.name)
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle(Str.getCode, for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 16
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.titleLabel?.font = UIFont(name: FontFamily.Poppins.bold.name, size: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(backButton)
        topView.addSubview(titleLabel)
        
        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(topView.snp.bottom).offset(40)
            make.height.equalTo(48)
        }
        
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.top.equalTo(textField.snp.bottom).offset(56)
        }
    }
    
    required init?(coder: NSCoder) { 
        fatalError("init(coder:) has not been implemented")
    }
}
