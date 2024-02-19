//
//  CustomSegmentedControl.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import UIKit

protocol SegmentedControlDelegate: AnyObject {
    func valueChanged(selectedIndex: Int)
}

class CustomSegmentedControl: UIView {
    
    var selectedIndex = 0
    var delegate: SegmentedControlDelegate?
    
    lazy var firstButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: FontFamily.Poppins.bold.name, size: 15)
        return button
    }()
    
    lazy var secondButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont(name: FontFamily.Poppins.bold.name, size: 15)
        return button
    }()
    
    lazy var stackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorGray.color
        setupConstraints()
        setupTargets()
        updateSelectedState()
    }
    
    func setupConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func selectionChanges(isFisrt: Bool) {
        if isFisrt {
            firstButton.backgroundColor = Asset.colorOrange.color
            firstButton.setTitleColor(Asset.colorWhite.color, for: .normal)
            secondButton.backgroundColor = Asset.colorGray.color
            secondButton.setTitleColor(Asset.colorDarkBlue.color, for: .normal)
        } else {
            firstButton.backgroundColor = Asset.colorGray.color
            firstButton.setTitleColor(Asset.colorDarkBlue.color, for: .normal)
            secondButton.backgroundColor = Asset.colorOrange.color
            secondButton.setTitleColor(Asset.colorWhite.color, for: .normal)
        }
    }
    
    func setupTargets() {
        firstButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }
    
    func updateSelectedState() {
        selectionChanges(isFisrt: selectedIndex == 0)
        delegate?.valueChanged(selectedIndex: selectedIndex)
    }
    
    @objc private func optionButtonTapped(_ sender: UIButton) {
        selectedIndex = sender == firstButton ? 0 : 1
        updateSelectedState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
