//
//  DetailsOrderView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import Foundation

import UIKit
import SnapKit

class DetailsOrderView: UIView {
    
    // MARK: - Tables subviews
    lazy var topView: TopView = {
        let view = TopView()
        var tableNumber = "..."
        view.topLabel.text = "Стол №\(tableNumber)"
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowBack"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        var id = "..."
        label.text = "№ \(id)"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        var time = "..."
        label.text = "Открыт в \(time)"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .colorDarkBlue
        label.textAlignment = .right
        return label
    }()
    
    lazy var waiterLabel: UILabel = {
        let label = UILabel()
        var waiterName = "..."
        label.text = "Официант: \(waiterName)"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var colorCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .colorRed
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    lazy var orderStateLabel: UILabel = {
        let label = UILabel()
        label.text = "Статус"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var itemsOrderedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createItemsOrderedSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        var price = "..."
        label.text = "\(price) сум."
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .colorOrange
        label.textAlignment = .left
        return label
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 7
        return stack
    }()
    
    lazy var closeAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть счет", for: .normal)
        button.titleLabel?.textColor = .colorLightBlue
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.colorLightBlue.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var addSupplementsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.textColor = .colorWhite
        button.backgroundColor = UIColor.colorLightBlue
        button.layer.cornerRadius = 12
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

extension DetailsOrderView {
    
    func setupConstraints() {
        
        // MARK: - Tables constraints
        addSubview(topView)
        topView.addSubview(backButton)
        addSubview(containerView)
        containerView.addSubview(idLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(waiterLabel)
        containerView.addSubview(colorCircle)
        containerView.addSubview(orderStateLabel)
        addSubview(itemsOrderedCollectionView)
        addSubview(totalLabel)
        addSubview(priceLabel)
        addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(closeAccountButton)
        buttonsStackView.addArrangedSubview(addSupplementsButton)
        //        addSubview(closeAccountButton)
        //        addSubview(addSupplementsButton)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(40)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(90)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(17)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.equalTo(17)
        }
        
        waiterLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.height.equalTo(16)
        }
        
        colorCircle.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview()
            make.height.width.equalTo(16)
        }
        
        orderStateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(colorCircle.snp.trailing).offset(10)
            make.height.equalTo(19)
        }
        
        itemsOrderedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(130)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(buttonsStackView.snp.top).offset(24)
            make.height.equalTo(24)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(totalLabel.snp.trailing).offset(5)
            make.centerY.equalTo(totalLabel.snp.trailing)
            make.height.equalTo(24)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
        closeAccountButton.snp.makeConstraints { make in
            make.bottom.leading.height.equalToSuperview()
            //            make.width.equalTo(168)
            //            make.height.equalTo(54)
        }
        //
        addSupplementsButton.snp.makeConstraints { make in
            make.bottom.trailing.height.equalToSuperview()
            //            make.width.equalTo(168)
            //            make.height.equalTo(54)
        }
        
    }
}

// MARK: - Compositional Layout
extension DetailsOrderView {
        
    private func createItemsOrderedSection() -> UICollectionViewCompositionalLayout {

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
//struct DetailsOrderViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        DetailsOrderViewController(viewModel: DetailsOrderViewModel()).showPreview()
//    }
//}
//#endif
