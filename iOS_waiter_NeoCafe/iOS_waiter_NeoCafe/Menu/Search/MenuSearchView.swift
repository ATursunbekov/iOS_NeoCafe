//
//  MenuSearchView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 16/04/24.
//

import UIKit
import SwiftUI

class MenuSearchView: UIView {
    
    lazy var searchBar = CustomSearchBar()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(cell: MenuCell.self)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .colorWhite
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(searchBar)
        addSubview(collectionView)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.bottom.equalToSuperview().inset(70)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Compositional Layout
extension MenuSearchView {
    private func createSection() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.10))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
