//
//  CoffeeSupplementsDrawerView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 12/04/24.
//

import UIKit
import SnapKit

class CoffeeSupplementsDrawerView: UIView {
    lazy var backgroundView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var drawerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.font = UIFont.poppins(ofSize: 24, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var milkTitle: UILabel = {
        let label = UILabel()
        label.text = "Молоко"
        label.font = UIFont.poppins(ofSize: 20, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var circleButtonFirst = CircleButton(text: "Коровье молоко", index: 0, delegate: self)
    lazy var circleButtonSecond = CircleButton(text: "Овсяное молоко", index: 0, delegate: self)
    lazy var circleButtonThird = CircleButton(text: "Соевое молоко", index: 0, delegate: self)
    
    lazy var syrupTitle: UILabel = {
        let label = UILabel()
        label.text = "Сироп"
        label.font = UIFont.poppins(ofSize: 20, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var rectangularButtonFirst = RectangularButton(text: "Клубничный", index: 0, delegate: self)
    lazy var rectangularButtonSecond = RectangularButton(text: "Карамельный", index: 1, delegate: self)
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CoffeeSupplementsDrawerView {
    private func setupConstraints() {
        addSubview(backgroundView)
        addSubview(drawerView)
        drawerView.addSubview(headerTitle)
        drawerView.addSubview(milkTitle)
        drawerView.addSubview(circleButtonFirst)
        drawerView.addSubview(circleButtonSecond)
        drawerView.addSubview(circleButtonThird)
        drawerView.addSubview(syrupTitle)
        drawerView.addSubview(rectangularButtonFirst)
        drawerView.addSubview(rectangularButtonSecond)
        drawerView.addSubview(saveButton)
        
        drawerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(419)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.height.equalTo(29)
        }
        
        milkTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(headerTitle.snp.bottom).offset(15)
        }
        
        circleButtonFirst.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(milkTitle.snp.bottom).offset(16)
            make.trailing.equalTo(circleButtonFirst.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        circleButtonSecond.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(circleButtonFirst.snp.bottom).offset(12)
            make.trailing.equalTo(circleButtonSecond.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        circleButtonThird.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(circleButtonSecond.snp.bottom).offset(12)
            make.trailing.equalTo(circleButtonThird.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        syrupTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(circleButtonThird.snp.bottom).offset(24)
        }
        
        rectangularButtonFirst.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(syrupTitle.snp.bottom).offset(16)
            make.trailing.equalTo(rectangularButtonFirst.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        rectangularButtonSecond.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(rectangularButtonFirst.snp.bottom).offset(16)
            make.trailing.equalTo(rectangularButtonFirst.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
    }
}

extension CoffeeSupplementsDrawerView: CircleButtonDelegate {
    func chooseOption(index: Int) {
        circleButtonFirst.innerView.isHidden = true
        circleButtonSecond.innerView.isHidden = true
        circleButtonThird.innerView.isHidden = true
        circleButtonFirst.circleView.backgroundColor = UIColor.colorGray
        circleButtonSecond.circleView.backgroundColor = UIColor.colorGray
        circleButtonThird.circleView.backgroundColor = UIColor.colorGray
    }
}

extension CoffeeSupplementsDrawerView: RectangularButtonDelegate {
    func chooseRectangularOption(index: Int) {
        rectangularButtonFirst.innerImage.isHidden = true
        rectangularButtonSecond.innerImage.isHidden = true
    }
}
