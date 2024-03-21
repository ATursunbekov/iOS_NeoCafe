//
//  TopView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

import UIKit
import SnapKit

class TopView: UIView {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorPeach
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var topBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: "topBean"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var bottomBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bottomBean"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(topLabel)
        topView.addSubview(topBean)
        topView.addSubview(bottomBean)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        topLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        topBean.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bottomBean.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
