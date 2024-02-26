//
//  BranchTableViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 21/2/24.
//

import UIKit

class BranchTableViewCell: UITableViewCell {
    static let identifier = "BranchTableViewCell"
    
    lazy var branchImage = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var name = {
        let label = UILabel()
        label.textColor = Asset.colorDarkBlue.color
        label.font = .poppins(size: 16, weight: .bold)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.cornerRadius = 12
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(branchImage)
        contentView.addSubview(name)
        
        branchImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(100)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(branchImage.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    func configureData(name: String, image: String) {
        branchImage.image = UIImage(named: image)
        self.name.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
