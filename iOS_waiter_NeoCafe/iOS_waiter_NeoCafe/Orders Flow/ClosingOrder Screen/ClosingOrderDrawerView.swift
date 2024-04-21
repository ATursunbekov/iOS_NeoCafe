//
//  ClosingOrderDrawerView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 12/04/24.
//

import UIKit
import SnapKit

class ClosingOrderDrawerView: UIView {
    
    lazy var backgroundView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var drawerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Закрытие счета"
        label.font = UIFont.poppins(ofSize: 24, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(cell: ClosingOrderCell.self)
        collectionView.register(header: ClosingOrderHeader.self)
        
        collectionView.showsVerticalScrollIndicator = true
        
        return collectionView
    }()
    
    lazy var stackHorizontal = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 0
        stack.addArrangedSubview(totalTextLabel)
        stack.addArrangedSubview(totalNumberLabel)
        return stack
    }()
    
    lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "... сом"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorLightBlue
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .bold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ClosingOrderDrawerView {
    private func setupConstraints() {
        addSubview(backgroundView)
        addSubview(drawerView)
        drawerView.addSubview(headerTitle)
        drawerView.addSubview(collectionView)
        drawerView.addSubview(stackHorizontal)
        drawerView.addSubview(saveButton)
        
        drawerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(419)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.height.equalTo(29)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerTitle.snp.bottom).offset(24)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(200)
        }
        
        stackHorizontal.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(drawerView.snp.centerX)
            make.height.equalTo(22)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.height.height.equalTo(54)
        }
    }
}

// MARK: - Collection view layout
extension ClosingOrderDrawerView {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createClosingOrderSection()
        }
    }
    
    private func createClosingOrderSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.86))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(86))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
