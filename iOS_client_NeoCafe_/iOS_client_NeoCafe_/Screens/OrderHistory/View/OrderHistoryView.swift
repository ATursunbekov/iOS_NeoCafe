//
//  OrderHistoryView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 27/2/24.
//

import SwiftUI
import UIKit

class OrderHistoryView: UIView {
    lazy var topView = TopView()

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.arrowBack.name), for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Str.orderHistoryTitle
        label.font = UIFont(name: FontFamily.Poppins.bold.name, size: 24)
        label.textColor = Asset.colorTitle.color
        return label
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 104
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(OrderTableViewCell.self, forCellReuseIdentifier: OrderTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(backButton)
        topView.addSubview(titleLabel)
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

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// #if DEBUG
//
// @available(iOS 13.0, *)
// struct OrderHistoryViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        OrderHistoryViewController().showPreview()
//    }
// }
// #endif
