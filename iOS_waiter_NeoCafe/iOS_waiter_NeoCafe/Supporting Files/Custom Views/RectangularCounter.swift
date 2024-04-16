//
//  RectangularCounter.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import SnapKit

protocol RectangularCounterDelegate: AnyObject {
    func removeItem()
    func addItem()
    func deductItem()
    func updateTotal()
}

class RectangularCounter: UIView {
    
    var counter = 1
    weak var delegate: RectangularCounterDelegate?
    
    lazy var minusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = UIColor.colorWhite
        return button
    }()
    
    lazy var plusButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = UIColor.colorWhite
        return button
    }()
    
    lazy var counterLabel = {
        let label = UILabel()
        label.text = String(counter)
        label.font = UIFont.poppins(ofSize: 18, weight: .bold)
        label.textColor = UIColor.colorWhite
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 12
        backgroundColor = UIColor.colorOrange
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
    
    private func setupConstraints() {
        addSubview(minusButton)
        addSubview(counterLabel)
        addSubview(plusButton)
        
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.width.height.equalTo(18)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(18)
        }
    }
    
    @objc func plusPressed() {
        if counter < 9 {
            counter += 1
            counterLabel.text = String(counter)
            delegate?.addItem()
            delegate?.updateTotal()
        }
    }
    
    @objc func minusPressed() {
        if counter == 1 {
            delegate?.deductItem()
            delegate?.updateTotal()
        } else {
            counter -= 1
            counterLabel.text = String(counter)
            delegate?.updateTotal()
        }
        delegate?.removeItem()
    }
}
