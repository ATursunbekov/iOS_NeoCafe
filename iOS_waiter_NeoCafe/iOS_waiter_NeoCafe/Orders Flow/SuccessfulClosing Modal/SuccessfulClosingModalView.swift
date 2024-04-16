//
//  SuccessfulClosingModalView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 12/04/24.
//

import UIKit
import SnapKit

class SuccessfulClosingModalView: UIView {
    
    lazy var modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "checkmarkGreen")
        view.image = image
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ успешно закрыт"
        label.textAlignment = .center
        label.font = UIFont.poppins(ofSize: 20, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
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

extension SuccessfulClosingModalView {
    private func setupConstraints() {
        addSubview(modalView)
        modalView.addSubview(imageView)
        modalView.addSubview(titleLabel)
        
        modalView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(197)
            make.width.equalTo(343)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
    }
}
