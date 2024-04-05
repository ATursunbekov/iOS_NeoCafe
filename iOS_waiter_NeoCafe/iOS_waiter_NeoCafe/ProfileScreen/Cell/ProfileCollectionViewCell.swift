//
//  ProfileCollectionViewCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 4/4/24.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    lazy var mainImage = {
        let image = UIImageView(image: UIImage(named: "sun"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func restImage() {
        mainImage.image = UIImage(named: "restImage")
        
        mainImage.snp.updateConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(14)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        contentView.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
