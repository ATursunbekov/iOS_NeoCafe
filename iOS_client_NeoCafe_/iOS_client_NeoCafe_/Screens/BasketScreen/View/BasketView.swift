//
//  BasketView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/2/24.
//

import UIKit
import SwiftUI

class BasketView: UIView {
    
    lazy var topView = TopView()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.addMore, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.setTitleColor(Asset.colorOrange.color, for: .normal)
        button.layer.borderColor = Asset.colorOrange.color.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 14
        return button
    }()
    
    lazy var screenTitle: UILabel = {
        let label = UILabel()
        label.text = Str.basketTitle
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.orderHistory.name), for: .normal)
        button.tintColor = Asset.colorWhite.color
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var segmentedController = CustomSegmentedControl(firstOption: Str.registration, secondOption: Str.inCafe)
    
    lazy var orderButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.order, for: .normal)
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = Asset.colorDarkBlue.color
        button.titleLabel?.font = .poppins(size: 16, weight: .bold)
        return button
    }()
    
    lazy var totalTitle: UILabel = {
        let label = UILabel()
        label.text = Str.total
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkGray.color
        return label
    }()
    
    lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = "730 c"
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorOrange.color
        return label
    }()
    
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 65))
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 120
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        customView.addSubview(addButton)
        tableView.tableFooterView = customView
        customView.backgroundColor = UIColor.clear
        return tableView
    }()
    
    lazy var emptyTitle: UILabel = {
        let label = UILabel()
        label.text = Str.emptyBasketTitle
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var emptyStatusImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.basketEmptyImage.name))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(screenTitle)
        topView.addSubview(historyButton)
        addSubview(segmentedController)
        addSubview(orderButton)
        addSubview(totalTitle)
        addSubview(costLabel)
        addSubview(tableView)
        addSubview(emptyTitle)
        addSubview(emptyStatusImage)
        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        screenTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        historyButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        segmentedController.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        orderButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-90)
            make.height.equalTo(54)
        }
        
        totalTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(orderButton.snp.top).offset(-12)
        }
        
        costLabel.snp.makeConstraints { make in
            make.bottom.equalTo(totalTitle.snp.bottom).offset(1)
            make.leading.equalTo(totalTitle.snp.trailing)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedController.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(costLabel.snp.top)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.centerX.equalToSuperview()
        }
        
        emptyTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(48)
        }
        
        emptyStatusImage.snp.makeConstraints { make in
            make.top.equalTo(emptyTitle.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(294)
        }
        
        emptyTitle.isHidden = true
        emptyStatusImage.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct BasketViewControllerPreview: PreviewProvider {
    static var previews: some View {
        BasketViewController().showPreview()
    }
}
#endif
