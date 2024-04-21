//
//  MainScreenSearchBar.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 18/2/24.
//

import SnapKit
import UIKit

class MainScreenSearchBar: UIView {
    lazy var textField: UILabel = {
        let label = UILabel()
        label.text = Str.searchPlaceholder
        label.font = .poppins(size: 15, weight: .regular)
        label.textColor = Asset.colorDarkGray.color
        return label
    }()

    lazy var searchButton = {
        let button = UIButton()
        button.backgroundColor = Asset.colorOrange.color
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.layer.cornerRadius = 24
        button.tintColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 24
        backgroundColor = Asset.colorGray.color
        setupConstraints()
    }

    func setupConstraints() {
        addSubview(textField)
        addSubview(searchButton)

        searchButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(48)
        }

        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalTo(searchButton.snp.leading).offset(-10)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
