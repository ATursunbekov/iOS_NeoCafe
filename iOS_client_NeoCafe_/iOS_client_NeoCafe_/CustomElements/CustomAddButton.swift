//
//  CustomAddButton.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 20/2/24.
//

import UIKit

protocol AddButtonDelegate: AnyObject {
    func removeButton()
}

class CustomAddButton: UIView {
    var counter = 1
    var delegate: AddButtonDelegate?
    
    lazy var minusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = Asset.colorGray.color
        button.tintColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var plusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = Asset.colorOrange.color
        button.tintColor = Asset.colorTitle.color
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var counterLabel = {
        let label = UILabel()
        label.text = String(counter)
        label.font = UIFont.poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        minusButton.addTarget(self, action: #selector(minusPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
    }
    
    func setupConstraints() {
        addSubview(minusButton)
        addSubview(counterLabel)
        addSubview(plusButton)
        
        minusButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(32)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(32)
        }
    }
    
    @objc func plusPressed() {
        counter += 1
        counterLabel.text = String(counter)
    }
    
    @objc func minusPressed() {
        if counter == 1 {
            delegate?.removeButton()
        } else {
            counter -= 1
            counterLabel.text = String(counter)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
