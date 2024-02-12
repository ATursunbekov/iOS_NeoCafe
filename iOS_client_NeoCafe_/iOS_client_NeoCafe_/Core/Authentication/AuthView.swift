//
//  AuthView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import UIKit
import SnapKit
import SwiftUI
import SVPinView

class AuthView: UIView {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorMain.color
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont(name: FontFamily.Poppins.bold.name, size: 32)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var topBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.topBean.name))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var bottomBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.bottomBean.name))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var customSegmentedControl: CustomSegmentedControl = {
        let controller = CustomSegmentedControl()
        controller.layer.cornerRadius = 24
        return controller
    }()
    
    lazy var textField = CustomTextField(placeholder: "Введите почту", image: Asset.dog.name)
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Получить код", for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 16
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.titleLabel?.font = UIFont(name: FontFamily.Poppins.bold.name, size: 16)
        return button
    }()
    
    lazy var firstErrorText: UILabel = {
        let label = UILabel()
        label.text = "Неправильный адрес электронной почты, попробуйте ещё раз"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: FontFamily.Poppins.medium.name, size: 16)
        label.textColor = Asset.colorRed.color
        return label
    }()
    
    lazy var pinView = {
        let pinView = SVPinView()
        pinView.pinLength = 4
        pinView.interSpace = 8
        pinView.textColor = .black
        pinView.font = UIFont(name: FontFamily.Poppins.regular.name, size: 20) ?? UIFont.systemFont(ofSize: 20)
        pinView.keyboardType = .numberPad
        pinView.shouldSecureText = false
        pinView.fieldBackgroundColor = Asset.colorGray.color
        pinView.pinInputAccessoryView = UIView()
//        pinView.borderLineColor = .red
        return pinView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(titleLabel)
        topView.addSubview(topBean)
        topView.addSubview(bottomBean)
        addSubview(customSegmentedControl)
        addSubview(textField)
        addSubview(button)
        addSubview(firstErrorText)
        addSubview(pinView)
        
        pinView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(23)
            make.centerY.equalToSuperview()
            make.height.equalTo(52)
        }
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        topBean.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bottomBean.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        customSegmentedControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(customSegmentedControl.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(56)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        firstErrorText.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(22)
            make.top.equalTo(customSegmentedControl.snp.bottom).offset(40)
        }
        firstErrorText.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct AuthViewControllerPreview: PreviewProvider {
    static var previews: some View {
        AuthViewController(viewModel: AuthViewModel()).showPreview()
    }
}
#endif
