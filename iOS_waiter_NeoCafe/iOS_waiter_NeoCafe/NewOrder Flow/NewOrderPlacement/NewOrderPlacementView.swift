//
//  NewOrderPlacementView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

class NewOrderPlacementView: UIView {
    
    lazy var topView: TopView = {
        let view = TopView()
        view.topLabel.text = "Новый заказ"
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowBack"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "checkmarkGreen")
        view.image = image
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ успешно оформлен"
        label.textAlignment = .center
        label.font = UIFont.poppins(ofSize: 24, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти к заказам", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorLightBlue
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .bold)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
        setupTargets()
    }
   
    private func setupConstraints() {
        
        addSubview(topView)
        topView.addSubview(backButton)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(nextButton)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(40)
        }
 
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.centerX.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(29)
        }
        
        nextButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.height.equalTo(54)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTargets() {
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
    }
    
    @objc func nextButtonPressed() {
    }
    
}
