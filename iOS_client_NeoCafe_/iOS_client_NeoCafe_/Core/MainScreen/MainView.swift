//
//  MainView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 18/2/24.
//

import UIKit
import SwiftUI

class MainView: UIView {
    
    lazy var topView = TopView()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Str.welcomeMessage
        label.font = UIFont(name: FontFamily.Poppins.bold.name, size: 24)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var bellButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var searchBar = CustomSearchBar()
    
    lazy var collectionView = {
//        let collectionViewLayout = UICollectionViewLayout()
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

                    if sectionIndex == 0 {
                        // First section with two groups
                        let itemSize1 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
                        let item1 = NSCollectionLayoutItem(layoutSize: itemSize1)
                        item1.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                        let groupSize1 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2))
                        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize1, subitem: item1, count: 2)

                        let itemSize2 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
                        let item2 = NSCollectionLayoutItem(layoutSize: itemSize2)
                        item2.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                        let groupSize2 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2))
                        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize2, subitem: item2, count: 3)

                        let section = NSCollectionLayoutSection(group: group1)
                        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                        section.boundarySupplementaryItems = []

                        return section
                    } else {
                        // Second section with one group
                        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
                        let item = NSCollectionLayoutItem(layoutSize: itemSize)

                        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2))
                        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                        section.boundarySupplementaryItems = []

                        return section
                    }
                }
        let collecitonView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecitonView.backgroundColor = .none
        collecitonView.bounces = false
        return collecitonView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(titleLabel)
        topView.addSubview(bellButton)
        addSubview(searchBar)
        addSubview(collectionView)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        bellButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(48)
            make.top.equalToSuperview().offset(116)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
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
struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        MainViewController().showPreview()
    }
}
#endif
