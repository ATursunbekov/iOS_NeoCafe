//
//  MainCategoryCollectionViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/2/24.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCategoryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        layer.cornerRadius = 14
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
