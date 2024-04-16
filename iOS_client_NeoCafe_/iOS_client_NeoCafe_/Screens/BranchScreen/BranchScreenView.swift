//
//  BranchScreenView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import SwiftUI
import UIKit

class BranchScreenView: UIView {
    lazy var topView = TopView()

    lazy var screenTitle: UILabel = {
        let label = UILabel()
        label.text = Str.branches
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorTitle.color
        return label
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.rowHeight = 280
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(BranchScreenTableViewCell.self, forCellReuseIdentifier: BranchScreenTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraitns()
    }

    func setupConstraitns() {
        addSubview(topView)
        topView.addSubview(screenTitle)
        addSubview(tableView)

        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(140)
        }

        screenTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
