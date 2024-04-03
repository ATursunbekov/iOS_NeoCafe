//
//  NotificationTableViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    static let identifier = "NotificationTableViewCell"
    
    lazy var backView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = Asset.colorMain.color.cgColor
        return view
    }()
    
    lazy var orderState: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ готов"
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "19:02"
        label.font = .poppins(size: 18, weight: .bold)
        label.textColor = Asset.colorMain.color
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Капучино x1, Американо x2, Багровай за..."
        label.font = .poppins(size: 14, weight: .regular)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    func setupConstraints() {
        contentView.addSubview(backView)
        backView.addSubview(orderState)
        backView.addSubview(timeLabel)
        backView.addSubview(descriptionLabel)
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        orderState.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func configureData(name: String, time: String, description: String) {
        orderState.text = name
        timeLabel.text = time
        descriptionLabel.text = description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
