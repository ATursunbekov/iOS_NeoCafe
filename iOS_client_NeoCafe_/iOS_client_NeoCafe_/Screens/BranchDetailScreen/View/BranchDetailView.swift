//
//  BranchDetailView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 29/2/24.
//

import UIKit
import SwiftUI

class BranchDetailView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    lazy var contentView = {
        let view = UIView()
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.arrowBack.name), for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 220)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        return collectionView
    }()
    
    lazy var pageController = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = Asset.colorOrange.color
        pc.pageIndicatorTintColor = UIColor.white
        return pc
    }()
    
    lazy var adressName: UILabel = {
        let label = UILabel()
        label.text = "NeoCafe Dzerzhinka"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var dopAdressInfo: UILabel = {
        let label = UILabel()
        label.text = "бульвар Эркиндик, 35"
        label.font = .poppins(size: 16, weight: .regular)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.branchLocationImage.name), for: .normal)
        button.tintColor = Asset.colorWhite.color
        button.backgroundColor = Asset.colorOrange.color
        button.layer.cornerRadius = 22
        return button
    }()
    
    lazy var phoneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.branchPhoneImage.name), for: .normal)
        button.tintColor = Asset.colorWhite.color
        button.backgroundColor = Asset.colorOrange.color
        button.layer.cornerRadius = 22
        return button
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.menuButton, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .bold)
        button.layer.cornerRadius = 16
        button.backgroundColor = Asset.colorDarkBlue.color
        return button
    }()
    
    lazy var infoDrop = InfoDropDown()
    
    lazy var recommendationTitle = {
        let label = UILabel()
        label.text = Str.popularFood
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 141, height: 201)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collection.alwaysBounceHorizontal = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    func setupConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(collectionView)
        contentView.addSubview(pageController)
        contentView.addSubview(backButton)
        contentView.addSubview(adressName)
        contentView.addSubview(dopAdressInfo)
        contentView.addSubview(locationButton)
        contentView.addSubview(phoneButton)
        contentView.addSubview(infoDrop)
        contentView.addSubview(recommendationTitle)
        contentView.addSubview(menuCollectionView)
        contentView.addSubview(menuButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
            make.bottom.equalTo(menuButton.snp.bottom).offset(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(220)
        }
        
        pageController.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(collectionView.snp.bottom).offset(-12)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(32)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        adressName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(24)
        }
        
        dopAdressInfo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(adressName.snp.bottom).offset(12)
        }
        
        locationButton.snp.makeConstraints { make in
            make.top.equalTo(dopAdressInfo.snp.bottom).offset(24)
            make.centerX.equalToSuperview().offset(-30)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        
        phoneButton.snp.makeConstraints { make in
            make.top.equalTo(dopAdressInfo.snp.bottom).offset(24)
            make.centerX.equalToSuperview().offset(30)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        
        menuButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
            make.top.equalTo(menuCollectionView.snp.bottom).offset(44)
        }
        
        infoDrop.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(phoneButton.snp.bottom).offset(24)
            make.bottom.equalTo(infoDrop.mainView.snp.bottom)
        }
        
        recommendationTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(infoDrop.snp.bottom).offset(32)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(recommendationTitle.snp.bottom).offset(16)
            make.height.equalTo(207)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct BranchDetailViewControllerPreview: PreviewProvider {
    static var previews: some View {
        BranchDetailViewController().showPreview()
    }
}
#endif
