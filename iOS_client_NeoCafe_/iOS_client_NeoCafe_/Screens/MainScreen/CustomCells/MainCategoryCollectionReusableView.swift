//
//  MainCategoryCollectionReusableView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/2/24.
//

import UIKit

class MainCategoryCollectionReusableView: UICollectionReusableView {
    static let identifier = "MainCategoryCollectionReusableView"
    
    lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = Str.menu
        label.font = UIFont.poppins(size: 16, weight: .medium)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var menuButton = {
        let button = UIButton()
        button.setTitle(Str.menuButton, for: .normal)
        button.setTitleColor(Asset.colorOrange.color, for: .normal)
        button.tintColor = Asset.colorOrange.color
        button.titleLabel?.font = .poppins(size: 16, weight: .regular)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(titleView)
        addSubview(menuButton)
        
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
