//
//  ErrorView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import SnapKit

class ErrorView: UIView {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "error")
        view.image = image
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Упс, что-то пошло не так"
        label.textAlignment = .center
        label.font = UIFont.poppins(ofSize: 24, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Обновить", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorLightBlue
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .bold)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
    }
   
    private func setupConstraints() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(updateButton)
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(343)
            make.height.equalTo(286)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.centerX.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(29)
        }
        
        updateButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.height.equalTo(54)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
