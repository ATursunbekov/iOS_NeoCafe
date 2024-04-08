////
////  NewOrderDirectoryView.swift
////  iOS_waiter_NeoCafe
////
////  Created by iPak Tulane on 28/03/24.
////
//
//import UIKit
//import SnapKit
//
//class NewOrderDirectoryView: UIView {
//    
//    // MARK: - Tables subviews
//    lazy var topView: TopView = {
//        let view = TopView()
//        view.topLabel.text = "Новый заказ"
//        return view
//    }()
//
//    lazy var backButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "arrowBack"), for: .normal)
//        button.layer.cornerRadius = 20
//        button.backgroundColor = UIColor.colorLightBlue
//        return button
//    }()
//
//    lazy var searchBar = CustomSearchBar()
//    
//    lazy var tableNumberLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Стол №..."
//        label.font = .systemFont(ofSize: 16)
//        label.textColor = .colorDarkBlue
//        label.textAlignment = .left
//        return label
//    }()
//
//    lazy var categoriesCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCategoriesSection())
//        collectionView.backgroundColor = .none
//        collectionView.bounces = false
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
//    
//    lazy var productsCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createProductsSection())
//        collectionView.backgroundColor = .none
//        collectionView.bounces = true
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
//        collectionView.showsVerticalScrollIndicator = false
//        return collectionView
//    }()
//    
//    lazy var orderButton: UIButton = {
//        let button = UIButton()
//        button.layer.cornerRadius = 16
//        button.backgroundColor = .colorOrange
//        return button
//    }()
//    
//    lazy var orderNumberLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Заказ №..."
//        label.font = .systemFont(ofSize: 16, weight: .bold)
//        label.textColor = .colorWhite
//        label.textAlignment = .left
//        return label
//    }()
//    
//    lazy var orderTotalAmountLabel: UILabel = {
//        let label = UILabel()
//        label.text = "... сом"
//        label.font = .systemFont(ofSize: 16, weight: .bold)
//        label.textColor = .colorWhite
//        label.textAlignment = .right
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = UIColor.colorWhite
//        setupConstraints()
//        hideSubviews()
//    }
//   
//    func setupConstraints() {
//        
//        // MARK: - Tables constraints
//        addSubview(topView)
//        topView.addSubview(backButton)
//        addSubview(searchBar)
//        addSubview(tableNumberLabel)
//        addSubview(categoriesCollectionView)
//        addSubview(productsCollectionView)
//        
//        topView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
//            make.height.equalTo(140)
//        }
//        
//        backButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(16)
//            make.height.width.equalTo(40)
//        }
//        
//        tableNumberLabel.snp.makeConstraints { make in
//            make.top.equalTo(topView.snp.bottom).offset(16)
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(16)
//        }
//                                
//        categoriesCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(tableNumberLabel.snp.bottom).offset(20)
//            make.leading.equalToSuperview().inset(16)
//            make.trailing.equalToSuperview().offset(50)
//            make.height.equalTo(34)
//        }
//        
//        productsCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(tableNumberLabel.snp.bottom).offset(32)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.bottom.equalToSuperview().inset(86)
//        }
//
//        addSubview(orderButton)
//        orderButton.addSubview(orderNumberLabel)
//        orderButton.addSubview(orderTotalAmountLabel)
//        
//        orderButton.snp.makeConstraints { make in
//            make.bottom.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(54)
//        }
//        
//        orderNumberLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(19)
//        }
//        
//        orderTotalAmountLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(19)
//        }
//    }
//    
//    func hideSubviews() {
//        orderButton.isHidden = true
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//// MARK: - Compositional Layout
//extension NewOrderDirectoryView {
//
//    private func createCategoriesSection() -> UICollectionViewCompositionalLayout {
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.interItemSpacing = .fixed(8)
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        return UICollectionViewCompositionalLayout(section: section)
//    }
//    
//    private func createProductsSection() -> UICollectionViewCompositionalLayout {
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 12
//
//        return UICollectionViewCompositionalLayout(section: section)
//    }
//
//}
