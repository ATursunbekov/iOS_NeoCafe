//
//  ProfileView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 1/3/24.
//

import UIKit

class ProfileView: UIView {
    
    lazy var topView = TopView()
    
    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.profileExit.name), for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Str.profileTitle
        label.font = UIFont(name: FontFamily.Poppins.bold.name, size: 24)
        label.textColor = Asset.colorTitle.color
        return label
    }()
    
    lazy var nameBackgroundView = {
        let view = UIView()
        view.layer.cornerRadius = 39
        view.backgroundColor = Asset.colorGray.color
        return view
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .poppins(size: 14, weight: .medium)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var bonusView = {
        let view = UIView()
        view.backgroundColor = Asset.colorTitle.color
        view.layer.cornerRadius = 24
        return view
    }()
    
    lazy var bonusTitle = {
        let label = UILabel()
        label.text = "Бонусы"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var bonusAmount = {
        let label = UILabel()
        label.text = "100"
        label.font = .poppins(size: 32, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var bonusImage = {
        let image = UIImageView(image: UIImage(named: Asset.profileBonusImage.name))
        return image
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
    
    lazy var editButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.profileEdit.name), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(exitButton)
        topView.addSubview(titleLabel)
        addSubview(nameBackgroundView)
        nameBackgroundView.addSubview(userName)
        nameBackgroundView.addSubview(editButton)
        addSubview(bonusView)
        bonusView.addSubview(bonusTitle)
        bonusView.addSubview(bonusAmount)
        bonusView.addSubview(bonusImage)
        addSubview(tableView)
        
        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        exitButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        nameBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(78)
        }
        
        userName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        bonusView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(nameBackgroundView.snp.bottom).offset(24)
            make.height.equalTo(110)
        }
        
        bonusTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(16)
        }
        
        bonusAmount.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(bonusTitle.snp.bottom).offset(11)
        }
        
        bonusImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.centerY.equalToSuperview()
            make.height.equalTo(94)
            make.width.equalTo(99)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bonusView.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
