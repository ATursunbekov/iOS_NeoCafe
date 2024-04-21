//
//  LogoutView.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 5/4/24.
//

import UIKit

protocol LogoutViewDelegate: AnyObject {
    func logout()
}

class LogoutView: UIViewController {
    
    var delegate: LogoutViewDelegate?
    
    lazy var backView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var titleLabel = {
        let title = UILabel()
        title.text = "Вы действительно хотите выйти?"
        title.textAlignment = .center
        title.font = UIFont.poppins(ofSize: 24, weight: .bold)
        title.numberOfLines = 0
        title.textColor = UIColor.colorDarkBlue
        return title
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.colorBlue.cgColor
        button.layer.borderWidth = 2
        button.setTitle("Да", for: .normal)
        button.setTitleColor(UIColor.colorBlue, for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.colorBlue
        button.setTitle("Нет", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.poppins(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        setupConstaints()
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
    }
    
    func setupConstaints() {
        view.addSubview(backView)
        backView.addSubview(titleLabel)
        backView.addSubview(confirmButton)
        backView.addSubview(cancelButton)
        
        backView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(192)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(24)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }
    }
    
    @objc func cancelPressed() {
        dismiss(animated: false)
    }
    
    @objc func logoutPressed() {
        dismiss(animated: false)
        delegate?.logout()
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct LogoutViewPreview: PreviewProvider {
//    static var previews: some View {
//        LogoutView().showPreview()
//    }
//}
//#endif
