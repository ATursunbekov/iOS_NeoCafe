//
//  PopularCollectionReusableView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/2/24.
//

import UIKit

class PopularCollectionReusableView: UICollectionReusableView {
    static let identifier = "PopularCollectionReusableView"
    
    lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = Str.popular
        label.font = UIFont.poppins(size: 16, weight: .medium)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(titleView)
        
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
