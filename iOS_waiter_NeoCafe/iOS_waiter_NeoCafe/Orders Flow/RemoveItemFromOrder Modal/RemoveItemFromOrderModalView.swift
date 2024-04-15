//
//  RemoveItemFromOrderModalView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 12/04/24.
//

import UIKit
import SnapKit

class RemoveItemFromOrderModalView: UIView {

    lazy var modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Удалить круассан \nиз заказа?"
        label.font = UIFont.poppins(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var yesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Да", for: .normal)
        button.setTitleColor(.colorDarkBlue, for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.colorLightBlue.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    lazy var noButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нет", for: .normal)
        button.setTitleColor(.colorWhite, for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = .colorLightBlue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.colorWhite
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RemoveItemFromOrderModalView {
    private func setupConstraints() {
        addSubview(modalView)
        modalView.addSubview(titleLabel)
        modalView.addSubview(yesButton)
        modalView.addSubview(noButton)
        
        modalView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(197)
            make.width.equalTo(343)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(58)
        }
        
        yesButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }
        
        noButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct RemoveItemFromOrderModalViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        RemoveItemFromOrderModalViewController(viewModel: RemoveItemFromOrderModalViewModel()).showPreview()
//    }
//}
//#endif
