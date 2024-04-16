//
//  CircularCounter.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit

protocol CircularCounterDelegate: AnyObject {
    func removeButton()
    func addPressed()
    func removePressed()
    func isEmptyCheck()
}

extension CircularCounterDelegate {
    func isEmptyCheck() {}
}

class CircularCounter: UIView {
    var counter = 1
    var delegate: CircularCounterDelegate?
    var buttonSize: Int = 32
    
    lazy var minusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = UIColor.colorGray
        button.tintColor = UIColor.colorDarkBlue
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var plusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = UIColor.colorOrange
        button.tintColor = UIColor.colorPeach
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var counterLabel = {
        let label = UILabel()
        label.text = String(counter)
        label.font = UIFont.poppins(size: 16, weight: .bold)
        label.textColor = UIColor.colorDarkBlue
        return label
    }()
    
    required init(fontSize: Int? = nil, buttonSize: Int? = nil) {
        super.init(frame: .zero)
        counterLabel.font = UIFont.poppins(size: CGFloat(fontSize ?? 16), weight: .bold)
        self.buttonSize = buttonSize ?? 32
        minusButton.layer.cornerRadius = CGFloat(buttonSize ?? 32) / 2.0
        plusButton.layer.cornerRadius = CGFloat(buttonSize ?? 32) / 2.0
        setupConstraints()
        minusButton.addTarget(self, action: #selector(minusPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAmount(_ amount: Int) {
        counterLabel.text = String(amount)
        counter = amount
    }
    
    func setupConstraints() {
        addSubview(minusButton)
        addSubview(counterLabel)
        addSubview(plusButton)
        
        minusButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(buttonSize)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(buttonSize)
        }
    }
    
    @objc func plusPressed() {
        if counter < 9 {
            counter += 1
            counterLabel.text = String(counter)
            delegate?.addPressed()
        }
        delegate?.isEmptyCheck()
    }
    
    @objc func minusPressed() {
        if counter == 1 {
            delegate?.removeButton()
        } else {
            delegate?.removePressed()
            counter -= 1
            counterLabel.text = String(counter)
        }
        delegate?.isEmptyCheck()
    }
}
