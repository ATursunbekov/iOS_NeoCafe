//
//  DetailCollectionViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 1/3/24.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailCollectionViewCell"
    
    lazy var image = {
        let image = UIImageView(image: UIImage(named: Asset.branchImage.name))
        image.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        image.layer.cornerRadius = 24
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        contentView.backgroundColor = .green
    }
    
    func setupConstraints() {
        contentView.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
