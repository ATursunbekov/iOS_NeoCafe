//
//  OrdersView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit
import SnapKit

class OrdersView: UIView {
    
    // MARK: - Tables subviews
    lazy var topView: TopView = {
        let view = TopView()
        view.topLabel.text = "Заказы"
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
    
    lazy var customSegmentedControl: CustomSegmentedControl = {
        let controller = CustomSegmentedControl()
        controller.layer.cornerRadius = 24
        return controller
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
    
    lazy var availabilityCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createAvailabilitySection())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(AvailabilityCell.self, forCellWithReuseIdentifier: AvailabilityCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Orders subviews

    lazy var orderStatesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createOrderStatesSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(OrderStateCell.self, forCellWithReuseIdentifier: OrderStateCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var tablesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createTablesSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
        hideSubviews()
    }
   
    func setupConstraints() {
        
        // MARK: - Tables constraints
        addSubview(topView)
        topView.addSubview(profileButton)
        topView.addSubview(noticeButton)
        addSubview(customSegmentedControl)
        addSubview(colorsContainer)
        colorsContainer.addSubview(grayCircle)
        colorsContainer.addSubview(reservedLabel)
        colorsContainer.addSubview(greenCircle)
        colorsContainer.addSubview(vacantLabel)
        addSubview(availabilityCollectionView)
        
        
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
        
        customSegmentedControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        colorsContainer.snp.makeConstraints { make in
            make.top.equalTo(customSegmentedControl.snp.bottom).offset(25)
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
        
        availabilityCollectionView.snp.makeConstraints { make in
            make.top.equalTo(colorsContainer.snp.bottom).offset(33)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(70)
        }
        
        // MARK: - Orders constraints
        addSubview(orderStatesCollectionView)
        addSubview(tablesCollectionView)
        
        orderStatesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(customSegmentedControl.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().offset(50)
            make.height.equalTo(34)
        }
        
        tablesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(customSegmentedControl.snp.bottom).offset(80)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(70)
        }
    }
    
    func hideSubviews() {
        orderStatesCollectionView.isHidden = true
        tablesCollectionView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Compositional Layout
extension OrdersView {
    
    private func createAvailabilitySection() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.23))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }

    private func createOrderStatesSection() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createTablesSection() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12

        return UICollectionViewCompositionalLayout(section: section)
    }

}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct OrdersViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        OrdersViewController(viewModel: OrdersViewModel()).showPreview()
//    }
//}
//#endif
