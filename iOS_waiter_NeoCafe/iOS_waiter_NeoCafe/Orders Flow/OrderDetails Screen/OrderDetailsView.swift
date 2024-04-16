//
//  OrderDetailsView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

class OrderDetailsView: UIView {
    
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
        label.font = UIFont.poppins(ofSize: 14, weight: .regular)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        var time = "..."
        label.text = "Открыт в \(time)"
        label.font = UIFont.poppins(ofSize: 14, weight: .regular)
        label.textColor = .colorDarkBlue
        label.textAlignment = .right
        return label
    }()
    
    lazy var waiterLabel: UILabel = {
        let label = UILabel()
        var waiterName = "..."
        label.text = "Официант: \(waiterName)"
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
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
        label.font = UIFont.poppins(ofSize: 16, weight: .regular)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var orderItemsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createOrderItemsSection())
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(cell: OrderItemCell.self)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    lazy var totalPriceStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.font = UIFont.poppins(ofSize: 14, weight: .bold)
        label.textColor = .colorDarkBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        var price = "..."
        label.text = "\(price) сом."
        label.font = UIFont.poppins(ofSize: 18, weight: .bold)
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
    
    lazy var closeOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть счет", for: .normal)
        button.setTitleColor(.colorLightBlue, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.colorLightBlue.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var addSupplementsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.colorWhite, for: .normal)
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

extension OrderDetailsView {
    
    private func setupConstraints() {
        // MARK: - Tables constraints
        addSubview(topView)
        topView.addSubview(backButton)
        addSubview(containerView)
        containerView.addSubview(idLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(waiterLabel)
        containerView.addSubview(colorCircle)
        containerView.addSubview(orderStateLabel)
        addSubview(orderItemsCollectionView)
        addSubview(totalPriceStackView)
        totalPriceStackView.addArrangedSubview(totalLabel)
        totalPriceStackView.addArrangedSubview(priceLabel)
        addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(closeOrderButton)
        buttonsStackView.addArrangedSubview(addSupplementsButton)

        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
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
        
        orderItemsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(130)
        }
        
        totalPriceStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(94)
        }

        totalLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(25)
            make.height.equalTo(54)
        }
        
        closeOrderButton.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.width.equalTo(168)
            make.height.equalTo(54)
        }

        addSupplementsButton.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
            make.width.equalTo(168)
            make.height.equalTo(54)
        }
    }
}

// MARK: - Compositional Layout
extension OrderDetailsView {
        
    private func createOrderItemsSection() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)

        return UICollectionViewCompositionalLayout(section: section)
    }
}
