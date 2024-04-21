//
//  CategoryCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {
    
    private lazy var customView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        return view
    }()
    
    private lazy var circleView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = UIColor.colorWhite
        return view
    }()
    
    private lazy var logoImage = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor.colorBlue
        return image
    }()
    
    private lazy var name = {
        let label = UILabel()
        label.font = UIFont.poppins(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(customView)
        customView.addSubview(circleView)
        circleView.addSubview(logoImage)
        customView.addSubview(name)
        
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        circleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(3)
            make.top.bottom.equalToSuperview().inset(3)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        name.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(circleView.snp.trailing).offset(8)
        }
    }
    
    func configureCell(with data: MockProductCategory) {
        self.name.text = data.rawValue
        logoImage.image = UIImage(named: data.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selected() {
        customView.backgroundColor = UIColor.colorOrange
        circleView.backgroundColor = UIColor.colorWhite
        name.textColor = UIColor.colorWhite
        logoImage.tintColor = UIColor.colorOrange
    }
    
    func deselected() {
        customView.backgroundColor = UIColor.colorGray
        circleView.backgroundColor = UIColor.colorWhite
        name.textColor = UIColor.colorDarkBlue
        logoImage.tintColor = UIColor.colorBlue
    }
}
