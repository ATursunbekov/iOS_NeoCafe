//
//  BranchScreenView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit
import SwiftUI

class BranchScreenView: UIView {
    
    lazy var topView = TopView()
    
    lazy var screenTitle: UILabel = {
        let label = UILabel()
        label.text = Str.branches
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
        topView.addSubview(historyButton)
        addSubview(tableView)
        
        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        screenTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        historyButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct BranchViewControllerPreview: PreviewProvider {
    static var previews: some View {
        BranchViewController().showPreview()
    }
}
#endif
