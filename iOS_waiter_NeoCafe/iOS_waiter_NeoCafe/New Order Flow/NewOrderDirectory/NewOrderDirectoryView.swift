//
//  NewOrderDirectoryView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//
//
import UIKit
import SnapKit

class NewOrderDirectoryView: UIView {
    
    lazy var topView: TopView = {
        let view = TopView()
        view.topLabel.text = "Новый заказ"
        return view
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowBack"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()

    lazy var searchBar = MainSearchBar()
    
    lazy var tableNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Стол № 1"
        label.font = UIFont.poppins(ofSize: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()

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
        collectionView.bounces = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(cell: ProductCell.self)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorGray
        button.setTitle("Заказ пустой", for: .disabled)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .semibold)
        button.setTitleColor(.colorDarkGray, for: .disabled)
        button.isEnabled = false
        return button
    }()
    
    lazy var orderNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ № 1"
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorWhite
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    
    lazy var orderTotalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "100 сом"
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorWhite
        label.textAlignment = .right
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
    }
   
    private func setupConstraints() {
        addSubview(topView)
        topView.addSubview(backButton)
        addSubview(searchBar)
        addSubview(tableNumberLabel)
        addSubview(categoriesCollectionView)
        addSubview(productsCollectionView)
        addSubview(orderButton)
        orderButton.addSubview(orderNumberLabel)
        orderButton.addSubview(orderTotalAmountLabel)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.centerY.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        tableNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(16)
        }
                                
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tableNumberLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().offset(50)
            make.height.equalTo(34)
        }
        
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(86)
        }
        
        orderButton.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview().inset(16)
//            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(54)
        }
        
        orderNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
        
        orderTotalAmountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureOrderButton(isEnabled: Bool) {
        if isEnabled {
            orderButton.isEnabled = true
            orderButton.backgroundColor = .colorOrange
            orderTotalAmountLabel.isHidden = false
            orderNumberLabel.isHidden = false
        } else {
            orderButton.isEnabled = false
            orderTotalAmountLabel.isHidden = true
            orderNumberLabel.isHidden = true
        }
    }
}

// MARK: - Compositional Layout
extension NewOrderDirectoryView {
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

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct NewOrderDirectoryViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        NewOrderDirectoryViewController(viewModel: NewOrderDirectoryViewModel()).showPreview()
//    }
//}
//#endif
