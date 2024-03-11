//
//  OrderDetailView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit
import SwiftUI

class OrderDetailView: UIView {
    
    lazy var topView = TopView()
    
    lazy var orderName: UILabel = {
        let label = UILabel()
        label.text = "Заказ #2324"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "NeoCafe Dzerzhinka, 4 октября"
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.arrowBack.name), for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()
    
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
    
    lazy var bonusTitle: UILabel = {
        let label = UILabel()
        label.text = Str.orderDeatilBonusLabel
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkGray.color
        return label
    }()
    
    lazy var bonusAmount: UILabel = {
        let label = UILabel()
        label.text = "50"
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorOrange.color
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 104
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(orderName)
        topView.addSubview(backButton)
        addSubview(adressLabel)
        addSubview(orderButton)
        addSubview(totalTitle)
        addSubview(costLabel)
        addSubview(bonusTitle)
        addSubview(bonusAmount)
        addSubview(tableView)
        
        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        orderName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        adressLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(topView.snp.bottom).offset(24)
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
        
        bonusTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(totalTitle.snp.top).offset(-16)
        }
        
        bonusAmount.snp.makeConstraints { make in
            make.bottom.equalTo(bonusTitle.snp.bottom).offset(1)
            make.leading.equalTo(bonusTitle.snp.trailing)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(adressLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bonusAmount.snp.top).offset(-1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
#if DEBUG

@available(iOS 13.0, *)
struct OrderDetailViewControllerPreview: PreviewProvider {
    static var previews: some View {
        OrderDetailViewController().showPreview()
    }
}
#endif
