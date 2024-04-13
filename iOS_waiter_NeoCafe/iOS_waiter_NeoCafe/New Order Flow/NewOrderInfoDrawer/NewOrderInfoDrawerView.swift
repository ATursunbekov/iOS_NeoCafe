//
//  NewOrderInfoDrawerView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 12/04/24.
//

import UIKit
import SnapKit

class NewOrderInfoDrawerView: UIView {
    
    lazy var backgroundView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var drawerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorLightBlue
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Заказ № 1"
        label.font = UIFont.poppins(ofSize: 24, weight: .bold)
        label.textColor = .colorWhite
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(cell: OrderItemCell.self)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    lazy var stackHorizontal = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.textAlignment = .left
        label.font = UIFont.poppins(ofSize: 16, weight: .semibold)
        label.textColor = .colorWhite
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "100 сом"
        label.textAlignment = .left
        label.font = UIFont.poppins(ofSize: 16, weight: .semibold)
        label.textColor = .colorWhite
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.colorWhite, for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorOrange
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

extension NewOrderInfoDrawerView {
    private func setupConstraints() {
        addSubview(backgroundView)
        addSubview(drawerView)
        drawerView.addSubview(headerTitle)
        drawerView.addSubview(collectionView)
        drawerView.addSubview(stackHorizontal)
        stackHorizontal.addArrangedSubview(totalTextLabel)
        stackHorizontal.addArrangedSubview(totalNumberLabel)
        drawerView.addSubview(saveButton)
        
        drawerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(537)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.height.equalTo(29)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerTitle.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(325)
        }
        
        stackHorizontal.snp.makeConstraints { make in
            make.bottom.equalTo(saveButton.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }

        totalTextLabel.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
        }
        
        totalNumberLabel.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
        }
                
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
    }
}

// MARK: - Compositional Layout
extension NewOrderInfoDrawerView {
    func createSection() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5

        return UICollectionViewCompositionalLayout(section: section)
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct NewOrderInfoDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        NewOrderInfoDrawerViewController(viewModel: NewOrderInfoDrawerViewModel()).showPreview()
//    }
//}
//#endif
