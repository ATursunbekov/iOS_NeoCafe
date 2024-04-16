//
//  MenuView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 16/04/24.
//

import UIKit
import SnapKit

class MenuView: UIView {
    
    lazy var topView: TopView = {
        let view = TopView()
        view.topLabel.text = "Меню"
        return view
    }()

    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "account"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()
    
    lazy var noticeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bell"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()

    lazy var searchBar = MainSearchBar()

    lazy var categoriesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCategoriesSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(cell: CategoryCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var productsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createProductsSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(cell: MenuCell.self)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
    }
   
    private func setupConstraints() {
        addSubview(topView)
        topView.addSubview(profileButton)
        topView.addSubview(noticeButton)
        addSubview(searchBar)
        addSubview(categoriesCollectionView)
        addSubview(productsCollectionView)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(40)
        }
        
        noticeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.centerY.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
                                
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().offset(50)
            make.height.equalTo(34)
        }
        
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(86)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Compositional Layout
extension MenuView {
    private func createCategoriesSection() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createProductsSection() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section)
    }
}
