//
//  MenuSearchView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct MenuSearchViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        MenuSearchViewController(viewModel: MenuSearchViewModel()).showPreview()
//    }
//}
//#endif
