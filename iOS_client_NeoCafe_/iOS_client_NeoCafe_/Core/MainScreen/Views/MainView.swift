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
        let collecitonView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collecitonView.backgroundColor = .none
        collecitonView.bounces = false
        collecitonView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collecitonView.register(MainCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MainCategoryCollectionViewCell.identifier)
        collecitonView.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: MainMenuCollectionViewCell.identifier)
        collecitonView.register(MainCategoryCollectionReusableView.self
                            , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader
                            , withReuseIdentifier: MainCategoryCollectionReusableView.identifier)
        collecitonView.register(PopularCollectionReusableView.self
                            , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader
                            , withReuseIdentifier: PopularCollectionReusableView.identifier)
        collecitonView.showsVerticalScrollIndicator = false
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

extension MainView {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0 {
                self.createCategorySection()
            } else {
                self.createPopularSection()
            }
        }
    }

private func createCategorySection() -> NSCollectionLayoutSection {
    let item1 = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
    item1.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0)
    let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.50)), repeatingSubitem: item1, count: 2)
    group1.interItemSpacing = .fixed(11)
    
    let item2 = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)))
//    item2.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
    let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45)), repeatingSubitem: item2, count: 3)
    group2.interItemSpacing = .fixed(12)
    
    let mainGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0)
                                           , heightDimension: .fractionalHeight(0.4)),
        subitems: [group1, group2])
    mainGroup.interItemSpacing = .fixed(13)
    let section = NSCollectionLayoutSection(group: mainGroup)
    
    let header = NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45)),
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top
    )
//    header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
    section.boundarySupplementaryItems = [header]
    return section
}

private func createPopularSection() -> NSCollectionLayoutSection {
    
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.86)))
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
//    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
    let header = NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: headerSize,
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top
    )
    section.boundarySupplementaryItems = [header]
    return section
}
}

#if DEBUG

@available(iOS 13.0, *)
struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        MainViewController(viewModel: MainViewModel()).showPreview()
    }
}
#endif
