//
//  MenuView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/2/24.
//

import UIKit
import SwiftUI

class MenuView: UIView {
    
    private lazy var topCustomView = TopView()
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.text = Str.menuTitle
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    private lazy var placeName = {
        let label = UILabel()
        label.font = .poppins(size: 16, weight: .medium)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var branchButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: Asset.dropSign.name), for: .normal)
        button.tintColor = Asset.colorTitle.color
        return button
    }()
    
    private lazy var menuTitle = {
        let label = UILabel()
        label.text = Str.categoryLabel
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    private lazy var searchBar = MainScreenSearchBar()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        return collectionView
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 0, right: 5)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collection.alwaysBounceVertical = true
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
        fetchData() // MARK: Setting place name
    }
    
    func fetchData() {
        placeName.text = DataManager.shared.getBranch()
    }
    
    func setupConstraints() {
        addSubview(topCustomView)
        topCustomView.addSubview(placeName)
        topCustomView.addSubview(titleLabel)
        topCustomView.addSubview(branchButton)
        addSubview(searchBar)
        addSubview(menuTitle)
        addSubview(categoryCollectionView)
        addSubview(menuCollectionView)
        
        topCustomView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        placeName.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(3)
            make.leading.equalTo(titleLabel.snp.trailing).offset(6)
        }
        
        branchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(10)
            make.width.equalTo(15)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        menuTitle.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(menuTitle.snp.bottom).offset(12)
            make.height.equalTo(34)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
#if DEBUG

@available(iOS 13.0, *)
struct MenuViewControllerPreview: PreviewProvider {
    static var previews: some View {
        MenuViewController().showPreview()
    }
}
#endif
