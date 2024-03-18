//
//  TopView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 18/2/24.
//

import UIKit
import SnapKit

class TopView: UIView {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorMain.color
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    lazy var topBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.topBean.name))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var bottomBean: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.bottomBean.name))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(topBean)
        topView.addSubview(bottomBean)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
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
