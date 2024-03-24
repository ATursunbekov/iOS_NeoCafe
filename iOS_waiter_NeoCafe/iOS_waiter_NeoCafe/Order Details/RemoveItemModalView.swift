//
//  RemoveItemModalView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

class RemoveItemFromOrderModalView: UIViewController {
    
    var statusNumber = 0
    
    // MARK: First popup
    lazy var modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Удалить ... из \nзаказа?"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var noButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нет", for: .normal)
        button.setTitleColor(.colorDarkBlue, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.colorDarkBlue.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    lazy var yesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Да", for: .normal)
        button.setTitleColor(.colorWhite, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = .colorDarkBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupConstraints()
        hideModalView()
        setupTargets()
    }
    
    func setupConstraints() {
        view.addSubview(modalView)
        modalView.addSubview(titleLabel)
        modalView.addSubview(noButton)
        modalView.addSubview(yesButton)
        
        modalView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(197)
            make.width.equalTo(343)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        noButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }
        
        yesButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }
//        hideModalView()
    }
    
    func hideModalView() {
        modalView.isHidden = true
    }
    
    func setupTargets() {
        yesButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(goBackward), for: .touchUpInside)
    }
    
    @objc func goBackward() {
        dismiss(animated: false)
    }
    
    @objc func goForward() {
        dismiss(animated: false)
    }
}





//@objc func minusButtonPressed() {
//    let vc = RemoveItemFromOrderModalView()
//    vc.modalPresentationStyle = .overFullScreen
//    present(vc, animated: false)
//}
