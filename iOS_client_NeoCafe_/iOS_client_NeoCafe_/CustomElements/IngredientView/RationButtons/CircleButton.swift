//
//  CircleButton.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/2/24.
//

import UIKit

protocol CircleButtonDelegate: AnyObject {
    func chooseOption(index: Int)
}

class CircleButton: UIView {
    
    var index = 0
    var delegate: CircleButtonDelegate?
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = Asset.colorMain.color.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = Asset.colorGray.color
        return view
    }()
    
    lazy var innerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorOrange.color
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .poppins(size: 16, weight: .regular)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    required init(text: String, index: Int, delegate: CircleButtonDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.index = index
        titleLabel.text = text
        setupConstraints()
        setupGestureDetector()
    }
    
    func setupConstraints() {
        addSubview(circleView)
        circleView.addSubview(innerView)
        addSubview(titleLabel)
        
        circleView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(20)
        }
        
        innerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(10)
            make.width.equalTo(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(circleView.snp.trailing).offset(8)
        }
        
        innerView.isHidden = true
    }
    
    func setupGestureDetector() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        circleView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        delegate?.chooseOption(index: index)
        innerView.isHidden = false
        circleView.backgroundColor = innerView.isHidden ? Asset.colorGray.color : Asset.colorWhite.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
