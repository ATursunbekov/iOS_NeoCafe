//
//  ProfileBonusView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/3/24.
//

import SwiftUI
import UIKit

class ProfileBonusView: UIViewController {
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()

    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.text = "Бонусы"
        text.font = .poppins(size: 24, weight: .bold)
        text.textColor = Asset.colorDarkBlue.color
        return text
    }()

    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.text = """
        Накапливайте бонусы и совершайте
        выгодные для Вас заказы!
        1 бонус = 1 сом
        """
        text.textAlignment = .center
        text.numberOfLines = 0
        text.font = .poppins(size: 14, weight: .medium)
        text.textColor = Asset.colorDarkBlue.color
        return text
    }()

    lazy var exitButton = {
        let button = UIButton()
        button.setTitle("Отлично!", for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = Asset.colorDarkBlue.color
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupConstraints()
        exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
    }

    func setupConstraints() {
        view.addSubview(backView)
        backView.addSubview(titleLabel)
        backView.addSubview(descriptionLabel)
        backView.addSubview(exitButton)

        backView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(224)
            make.width.equalTo(343)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(47)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }

        exitButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.height.equalTo(54)
        }
    }

    @objc func exitPressed() {
        dismiss(animated: false)
    }
}

#if DEBUG

    @available(iOS 13.0, *)
    struct ProfileBonusViewPreview: PreviewProvider {
        static var previews: some View {
            ProfileBonusView().showPreview()
        }
    }
#endif
