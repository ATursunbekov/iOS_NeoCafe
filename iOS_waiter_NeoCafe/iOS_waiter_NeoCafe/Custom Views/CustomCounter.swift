//
//  CustomCounter.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit

protocol CounterDelegate: AnyObject {
    func addItem()
    func deductItem()
    func isEmpty(_: Bool)
}

extension CounterDelegate {
    func isEmpty(_: Bool) {}
}

class CustomCounter: UIView {
    var counter = 1
    weak var delegate: CounterDelegate?
    var buttonSize: Int = 36
    
    lazy var minusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .colorGray
        button.tintColor = .colorDarkBlue
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var plusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .colorOrange
        button.tintColor = .colorPeach
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var counterLabel = {
        let label = UILabel()
        label.text = String(counter)
        label.font = UIFont.poppins(size: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    required init(fontSize: Int? = nil, buttonSize: Int? = nil) {
        super.init(frame: .zero)
        counterLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize ?? 16), weight: .bold)
        self.buttonSize = buttonSize ?? 32
        minusButton.layer.cornerRadius = CGFloat(buttonSize ?? 32) / 2.0
        plusButton.layer.cornerRadius = CGFloat(buttonSize ?? 32) / 2.0
        setupConstraints()
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
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
            make.center.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(buttonSize)
        }
    }
    
    @objc func plusButtonPressed() {
        if counter < 9 {
            counter += 1
            counterLabel.text = String(counter)
            delegate?.addItem()
        }
    }
    
    @objc func minusButtonPressed() {
        if counter == 1 {
            delegate?.deductItem()
        } else {
            counter -= 1
            counterLabel.text = String(counter)
        }
    }
}
