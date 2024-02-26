//
//  DetailView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 24/2/24.
//

import UIKit
import SwiftUI

class DetailView: UIView {
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.cofe2.name))
        image.contentMode = .scaleToFill
        image.backgroundColor = .red
        image.layer.cornerRadius = 24
        image.clipsToBounds = true
        image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.arrowBack.name), for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = Str.productDetailDescription
        label.font = .poppins(size: 15, weight: .regular)
        label.textColor = Asset.colorMain.color
        label.numberOfLines = 0
        return label
    }()
    
    lazy var basketButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.basketButton, for: .normal)
        button.backgroundColor = Asset.colorDarkBlue.color
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .bold)
        button.layer.cornerRadius = 14
        return button
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = "140 с"
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorOrange.color
        return label
    }()
    
    private lazy var customButton = CustomAddButton(fontSize: 32, buttonSize: 40)
    
    private lazy var additionalProductName: UILabel = {
        let label = UILabel()
        label.font = .poppins(size: 16, weight: .bold)
        label.text = Str.productDetailRecommendation
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 102
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.colorWhite.color
        setupConstaints()
    }
    
    func setupConstaints() {
        addSubview(productImage)
        addSubview(backButton)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(basketButton)
        addSubview(costLabel)
        addSubview(customButton)
        addSubview(additionalProductName)
        addSubview(tableView)
        
        productImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(220)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(productImage.snp.bottom).offset(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        basketButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(55)
            make.width.equalTo(203)
        }
        
        costLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(basketButton.snp.top).offset(-7)
        }
        
        customButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-27)
            make.width.equalTo(124)
            make.height.equalTo(40)
        }
        
        additionalProductName.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(additionalProductName.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(costLabel.snp.top)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct DetailViewControllerPreview: PreviewProvider {
    static var previews: some View {
        DetailViewController().showPreview()
    }
}
#endif
