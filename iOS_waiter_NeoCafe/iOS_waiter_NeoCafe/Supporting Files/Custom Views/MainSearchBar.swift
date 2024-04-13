//
//  MainSearchBar.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 10/04/24.
//

import UIKit
import SnapKit

class MainSearchBar: UIView {
    
    lazy var textField: UILabel = {
        let label = UILabel()
        label.text = "Поиск"
        label.font = UIFont.poppins(ofSize: 15, weight: .regular)
        label.textColor = .colorDarkGray
        return label
    }()
    
    lazy var searchButton = {
        let button = UIButton()
        button.backgroundColor = .colorOrange
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.layer.cornerRadius = 24
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 24
        backgroundColor = .colorGray
        setupConstraints()
    }
    
    private func setupConstraints() {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
