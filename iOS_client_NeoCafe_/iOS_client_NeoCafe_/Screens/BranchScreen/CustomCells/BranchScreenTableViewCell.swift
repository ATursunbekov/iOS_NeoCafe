//
//  BranchScreenTableViewCell.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 28/2/24.
//

import UIKit

class BranchScreenTableViewCell: UITableViewCell {
    static let identifier = "BranchScreenTableViewCell"

    lazy var branchImage = {
        let image = UIImageView(image: UIImage(named: Asset.branchImage.name))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()

    lazy var timeView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = Asset.colorWhite.color
        return view
    }()

    lazy var workingTime: UILabel = {
        let label = UILabel()
        label.text = Str.branchSchedule
        label.textColor = Asset.colorDarkBlue.color
        label.font = .poppins(size: 14, weight: .regular)
        return label
    }()

    lazy var adressLabel = {
        let label = UILabel()
        label.text = Str.branchAdress
        label.textColor = Asset.colorDarkBlue.color
        label.font = .poppins(size: 16, weight: .regular)
        return label
    }()

    lazy var numberLabel = {
        let label = UILabel()
        label.text = Str.phoneNumber
        label.textColor = Asset.colorDarkBlue.color
        label.font = .poppins(size: 16, weight: .regular)
        return label
    }()

    lazy var locationImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.branchLocationImage.name))
        image.contentMode = .scaleAspectFit
        image.tintColor = Asset.colorOrange.color
        return image
    }()

    lazy var phoneImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.branchPhoneImage.name))
        image.contentMode = .scaleAspectFit
        image.tintColor = Asset.colorOrange.color
        return image
    }()

    lazy var name = {
        let label = UILabel()
        label.text = Str.branchName
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

    func configureData(response: BranchResponses) {
        adressLabel.text = response.address
        numberLabel.text = response.phoneNumber
        name.text = response.name
        workingTime.text = "Сегодня с \(response.workDays[getWeekDay()].from) до \(response.workDays[getWeekDay()].to)"
    }

    func getWeekDay() -> Int {
        let now = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: now)
        return (weekDay + 5) % 7
    }

    func setupConstraints() {
        contentView.addSubview(branchImage)
        branchImage.addSubview(timeView)
        timeView.addSubview(workingTime)
        contentView.addSubview(name)
        contentView.addSubview(adressLabel)
        contentView.addSubview(locationImage)
        contentView.addSubview(phoneImage)
        contentView.addSubview(numberLabel)

        branchImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(128)
        }

        timeView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(26)
            make.width.equalTo(177)
        }

        workingTime.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        name.snp.makeConstraints { make in
            make.top.equalTo(branchImage.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(16)
        }

        locationImage.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(26)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(17)
            make.width.equalTo(12)
        }

        adressLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationImage.snp.trailing).offset(9)
            make.bottom.equalTo(locationImage.snp.bottom).offset(4)
        }

        phoneImage.snp.makeConstraints { make in
            make.top.equalTo(locationImage.snp.bottom).offset(10.5)
            make.centerX.equalTo(locationImage.snp.centerX)
            make.height.equalTo(15)
            make.width.equalTo(15)
        }

        numberLabel.snp.makeConstraints { make in
            make.leading.equalTo(phoneImage.snp.trailing).offset(9)
            make.bottom.equalTo(phoneImage.snp.bottom).offset(5)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
