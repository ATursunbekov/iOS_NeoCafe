//
//  InfoDropDown.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 1/3/24.
//

import UIKit

class InfoDropDown: UIView {
    
    lazy var mainView = UIView()
    
    lazy var scheduleLabel: UILabel = {
        let label = UILabel()
        label.text = Str.schedule
        label.font = .poppins(size: 16, weight: .regular)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var showButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.branchArrowDown.name), for: .normal)
        return button
    }()
    
    lazy var weekDay: UILabel = {
        let label = UILabel()
        label.text = Str.weekDay
        label.numberOfLines = 0
        label.font = .poppins(size: 16, weight: .regular)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var time: UILabel = {
        let label = UILabel()
        label.text = "11:00 - 22:00\n11:00 - 22:00\n11:00 - 22:00\n11:00 - 22:00\n11:00 - 22:00\n11:00 - 22:00\n11:00 - 22:00"
        label.numberOfLines = 0
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        showButton.addTarget(self, action: #selector(showPressed), for: .touchUpInside)
    }
    
    func setupConstraints() {
        addSubview(mainView)
        addSubview(scheduleLabel)
        addSubview(showButton)
        addSubview(weekDay)
        addSubview(time)
        
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(scheduleLabel.snp.bottom).offset(2.5)
        }
        
        scheduleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(2.5)
        }
        
        showButton.snp.makeConstraints { make in
            make.height.equalTo(5)
            make.width.equalTo(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(9)
        }
        
        weekDay.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(scheduleLabel.snp.bottom).offset(8)
        }
        
        time.snp.makeConstraints { make in
            make.leading.equalTo(weekDay.snp.trailing).offset(4)
            make.bottom.equalTo(weekDay.snp.bottom).offset(1)
        }
        
        weekDay.isHidden = true
        time.isHidden = true
    }
    
    @objc func showPressed() {
        UIView.animate(withDuration: 3) {
            if self.weekDay.isHidden {
                self.mainView.snp.updateConstraints { make in
                    make.bottom.equalTo(self.scheduleLabel.snp.bottom).offset(191)
                }
            } else {
                self.mainView.snp.updateConstraints { make in
                    make.bottom.equalTo(self.scheduleLabel.snp.bottom).offset(2.5)
                }
            }
        }
        self.layoutIfNeeded()
        weekDay.isHidden.toggle()
        time.isHidden.toggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
