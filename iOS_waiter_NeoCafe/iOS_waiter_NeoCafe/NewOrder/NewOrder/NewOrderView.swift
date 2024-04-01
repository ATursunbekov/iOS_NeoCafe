//
//  NewOrderView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

class NewOrderView: UIView {
    
    // MARK: - Tables subviews
    lazy var topView: TopView = {
        let view = TopView()
        view.topLabel.text = "Новый заказ"
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
    
    lazy var chooseTableText: UILabel = {
        let label = UILabel()
        label.text = "Выберите стол"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var colorsContainer: UIView = {
        let container = UIView()
        return container
    }()
    
    lazy var grayCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .colorGray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    lazy var greenCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .colorGreen
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    lazy var reservedLabel: UILabel = {
        let label = UILabel()
        label.text = "Занято"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var vacantLabel: UILabel = {
        let label = UILabel()
        label.text = "Свободно"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(AvailabilityClickableCell.self, forCellWithReuseIdentifier: AvailabilityClickableCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
    }
   
    func setupConstraints() {
        
        // MARK: - Tables constraints
        addSubview(topView)
        topView.addSubview(profileButton)
        topView.addSubview(noticeButton)
        addSubview(chooseTableText)
        addSubview(colorsContainer)
        colorsContainer.addSubview(grayCircle)
        colorsContainer.addSubview(reservedLabel)
        colorsContainer.addSubview(greenCircle)
        colorsContainer.addSubview(vacantLabel)
        addSubview(collectionView)
        
        
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
        
        chooseTableText.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
        
        colorsContainer.snp.makeConstraints { make in
            make.top.equalTo(chooseTableText.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }

        grayCircle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(20)
        }

        reservedLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(grayCircle.snp.trailing).offset(8)
        }
        
        greenCircle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(reservedLabel.snp.trailing).offset(32)
            make.height.width.equalTo(20)
        }
        
        vacantLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(greenCircle.snp.trailing).offset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(colorsContainer.snp.bottom).offset(33)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(70)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Compositional Layout
extension NewOrderView {
    
    private func createSection() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.23))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct NewOrderViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        NewOrderViewController(viewModel: NewOrderViewModel()).showPreview()
//    }
//}
//#endif
