//
//  RectengularButton.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/2/24.
//

import UIKit

protocol RectengularButtonDelegate: AnyObject {
    func chooseRectengularOption(index: Int)
}

class RectengularButton: UIView {
    
    var index = 0
    var delegate: RectengularButtonDelegate?
    
    lazy var rectengularView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderColor = Asset.colorSecondDarkBlue.color.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var innerImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.checkMark.name))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .poppins(size: 16, weight: .regular)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    required init(text: String, index: Int, delegte: RectengularButtonDelegate) {
        super.init(frame: .zero)
        self.delegate = delegte
        self.index = index
        titleLabel.text = text
        setupConstraints()
        setupGestureDetector()
    }
    
    func setupConstraints() {
        addSubview(rectengularView)
        rectengularView.addSubview(innerImage)
        addSubview(titleLabel)
        
        rectengularView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(20)
        }
        
        innerImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(9.5)
            make.width.equalTo(11)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(rectengularView.snp.trailing).offset(8)
        }
        
        innerImage.isHidden = true
    }
    
    func setupGestureDetector() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        rectengularView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        delegate?.chooseRectengularOption(index: index)
        innerImage.isHidden = false
        rectengularView.layer.borderColor = innerImage.isHidden ? Asset.colorMain.color.cgColor : Asset.colorSecondDarkBlue.color.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
