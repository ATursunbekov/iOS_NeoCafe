//
//  AuthView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

import UIKit
import SnapKit
import SVPinView

class AuthView: UIView {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorPeach
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont.poppins(ofSize: 32, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var topBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: "topBean"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var bottomBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bottomBean"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField = CustomTextField(placeholder: "Введите логин", image: "person")
                                              
    lazy var passwordTextField = CustomTextField(placeholder: "Введите пароль", image: "lock")
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Получить код", for: .normal)
        button.backgroundColor = UIColor.colorLightBlue
        button.layer.cornerRadius = 16
        button.setTitleColor(UIColor.colorWhite, for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .bold)
        return button
    }()
    
    lazy var pinView = {
        let pinView = SVPinView()
        pinView.pinLength = 4
        pinView.interSpace = 8
        pinView.textColor = .black
        pinView.font = UIFont.poppins(ofSize: 20, weight: .regular)
        pinView.keyboardType = .numberPad
        pinView.shouldSecureText = false
        pinView.fieldBackgroundColor = UIColor.colorGray
        pinView.pinInputAccessoryView = UIView()
        return pinView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowBack"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorDarkGray
        return button
    }()
    
    lazy var confirmationLabel = {
        let label = UILabel()
        label.text = "Введите 4-хзначный код, \nотправленный на почту"
        label.numberOfLines = 0
        label.font = UIFont.poppins(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    lazy var gmailLabel = {
        let label = UILabel()
        label.text = "ipak.dev@gmail.com"
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var resendButton = {
        let button = UIButton()
        button.setTitle("Отправить еще раз через ", for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 14, weight: .medium)
        button.setTitleColor(UIColor.colorDarkGray, for: .normal)
        return button
    }()
    
    lazy var timeCounter = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.poppins(ofSize: 14, weight: .bold)
        label.textColor = UIColor.colorDarkGray
        return label
    }()
    
    lazy var underlineView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorRed
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
        hideSubviews()
        passwordTextField.textField.isSecureTextEntry = true
    }
    
    private func setupConstraints() {
        addSubview(topView)
        topView.addSubview(topLabel)
        topView.addSubview(topBean)
        topView.addSubview(bottomBean)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(button)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        topLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        topBean.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bottomBean.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(216)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        // MARK: - Code Confirmation View
        topView.addSubview(backButton)
        addSubview(confirmationLabel)
        addSubview(gmailLabel)

        addSubview(pinView)
        addSubview(underlineView)
        
        addSubview(resendButton)
        addSubview(timeCounter)

        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        confirmationLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
        }
        
        gmailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(confirmationLabel.snp.bottom).offset(10)
        }
        
        pinView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(23)
            make.top.equalTo(gmailLabel.snp.bottom).offset(16)
            make.height.equalTo(52)
        }
        
        underlineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(resendButton.snp.leading)
            make.trailing.equalTo(resendButton.snp.trailing)
            make.top.equalTo(resendButton.snp.bottom).offset(1)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(16)
            make.centerX.equalToSuperview().offset(-20)
        }
        
        timeCounter.snp.makeConstraints { make in
            make.centerY.equalTo(resendButton.snp.centerY)
            make.leading.equalTo(resendButton.snp.trailing).offset(1)
        }
    }
    
    func hideSubviews() {
        backButton.isHidden = true
        confirmationLabel.isHidden = true
        gmailLabel.isHidden = true
        pinView.isHidden = true
        underlineView.isHidden = true
        resendButton.isHidden = true
        timeCounter.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
