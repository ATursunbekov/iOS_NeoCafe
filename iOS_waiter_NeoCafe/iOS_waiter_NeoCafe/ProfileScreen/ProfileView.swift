//
//  ProfileView.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 3/4/24.
//

import UIKit
import SwiftUI

class ProfileView: UIView {
    
    lazy var topView: TopView = {
        let view = TopView()
        view.topLabel.text = "Профиль"
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowBack"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()
    
    lazy var logout: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "logout"), for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.colorLightBlue
        return button
    }()
    
    lazy var nameTitle: UILabel = {
        let name = UILabel()
        name.text = "Имя"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorBlue
        return name
    }()
    
    lazy var nameBackView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorGray
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var userImage = {
        let image = UIImageView(image: UIImage(named: "account"))
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor.colorDarkBlue
        return image
    }()
    
    lazy var name: UILabel = {
        let name = UILabel()
        name.text = "Алихандро"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var scheduleTitle = {
        let name = UILabel()
        name.text = "График работы"
        name.font = UIFont.poppins(ofSize: 24, weight: .bold)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var sunImage = {
        let image = UIImageView(image: UIImage(named: "sun"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var moonImage = {
        let image = UIImageView(image: UIImage(named: "moon"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var restImage = {
        let image = UIImageView(image: UIImage(named: "restImage"))
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var workingTitle = {
        let name = UILabel()
        name.text = "Дневная смена"
        name.font = UIFont.poppins(ofSize: 16, weight: .medium)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var nightWorkingTitle = {
        let name = UILabel()
        name.text = "Ночная смена"
        name.font = UIFont.poppins(ofSize: 16, weight: .medium)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var restTitle = {
        let name = UILabel()
        name.text = "Выходной"
        name.font = UIFont.poppins(ofSize: 16, weight: .medium)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day1 = {
        let name = UILabel()
        name.text = "Пн"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day2 = {
        let name = UILabel()
        name.text = "Вт"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day3 = {
        let name = UILabel()
        name.text = "Ср"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day4 = {
        let name = UILabel()
        name.text = "Чт"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day5 = {
        let name = UILabel()
        name.text = "Пт"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day6 = {
        let name = UILabel()
        name.text = "Сб"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var day7 = {
        let name = UILabel()
        name.text = "Вс"
        name.font = UIFont.poppins(ofSize: 16, weight: .regular)
        name.textColor = UIColor.colorDarkBlue
        return name
    }()
    
    lazy var stackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 29
        return stack
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 28
        layout.itemSize = CGSize(width: 24, height: 24)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        addSubview(topView)
        topView.addSubview(backButton)
        topView.addSubview(logout)
        addSubview(nameTitle)
        addSubview(nameBackView)
        nameBackView.addSubview(userImage)
        nameBackView.addSubview(name)
        addSubview(scheduleTitle)
        addSubview(sunImage)
        addSubview(moonImage)
        addSubview(restImage)
        addSubview(workingTitle)
        addSubview(nightWorkingTitle)
        addSubview(restTitle)
        addSubview(stackView)
        stackView.addArrangedSubview(day1)
        stackView.addArrangedSubview(day2)
        stackView.addArrangedSubview(day3)
        stackView.addArrangedSubview(day4)
        stackView.addArrangedSubview(day5)
        stackView.addArrangedSubview(day6)
        stackView.addArrangedSubview(day7)
        addSubview(collectionView)
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        logout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        nameTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(188)
        }
        
        nameBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(nameTitle.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        userImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        name.snp.makeConstraints { make in
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        scheduleTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameBackView.snp.bottom).offset(40)
        }
        
        sunImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(scheduleTitle.snp.bottom).offset(16)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        workingTitle.snp.makeConstraints { make in
            make.centerY.equalTo(sunImage.snp.centerY)
            make.leading.equalTo(sunImage.snp.trailing).offset(10)
        }
        
        moonImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(sunImage.snp.bottom).offset(12)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        nightWorkingTitle.snp.makeConstraints { make in
            make.centerY.equalTo(moonImage.snp.centerY)
            make.leading.equalTo(moonImage.snp.trailing).offset(10)
        }
        
        restImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalTo(moonImage.snp.bottom).offset(23)
            make.height.equalTo(2)
            make.width.equalTo(14)
        }
        
        restTitle.snp.makeConstraints { make in
            make.leading.equalTo(nightWorkingTitle.snp.leading)
            make.centerY.equalTo(restImage.snp.centerY)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
            make.top.equalTo(restTitle.snp.bottom).offset(27)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct ProfileViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        ProfileViewController().showPreview()
//    }
//}
//#endif
