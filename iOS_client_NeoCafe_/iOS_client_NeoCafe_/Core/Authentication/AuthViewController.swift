//
//  ViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 4/2/24.
//

import UIKit
import SnapKit
import SwiftUI

class AuthViewController: UIViewController {
    
    let viewModel: AuthViewModelProtocol
    let authView = AuthView()
    
    init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        setDelegates()
    }
    
    func setupTargets() {
        authView.button.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        authView.textField.textField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
    }
    
    func setDelegates() {
        authView.customSegmentedControl.delegate = self
    }
    
    func delay(_ delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    func cleanErrors() {
        UIView.animate(withDuration: 0.5) {
            self.authView.textField.snp.updateConstraints { make in
                make.top.equalTo(self.authView.customSegmentedControl.snp.bottom).offset(40)
            }
            self.authView.textField.logo.tintColor = Asset.colorDarkBlue.color
            self.authView.textField.textField.attributedPlaceholder = NSAttributedString(string: "Введите почту", attributes:
                                                                                        [
                                                                                            .foregroundColor: Asset.colorDarkGray.color,
                                                                                            .font: UIFont(name: FontFamily.Poppins.regular.name, size: 16) ?? UIFont.systemFont(ofSize: 16)
                                                                                        ]
            )
            self.authView.firstErrorText.isHidden = true
            self.view.layoutIfNeeded()
        }
    }
    
    func showError() {
        UIView.animate(withDuration: 0.5, animations: {
            self.authView.textField.snp.updateConstraints { make in
                make.top.equalTo(self.authView.customSegmentedControl.snp.bottom).offset(116)
            }
            self.view.layoutIfNeeded()
        }) { _ in
            self.authView.firstErrorText.isHidden = false
            self.authView.textField.logo.tintColor = Asset.colorRed.color
            self.authView.textField.textField.attributedPlaceholder = NSAttributedString(string: "Введите почту", attributes:
                                                                            [
                                                                                .foregroundColor: Asset.colorRed.color,
                                                                                .font: UIFont(name: FontFamily.Poppins.regular.name, size: 16) ?? UIFont.systemFont(ofSize: 16)
                                                                            ]
            )
        }
    }
    
    @objc func textFieldChanged(_ sender: UITextField) {
        if sender.text != "" {
            cleanErrors()
        }
    }
    
    @objc func nextPressed() {
        if authView.textField.textField.text == "" {
            showError()
        } else {
            print("Next Task!")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthViewController: SegmentedControlDelegate {
    func valueChanged(selectedIndex: Int) {
        if selectedIndex == 0 {
            authView.titleLabel.text = "Вход"
        } else {
            authView.titleLabel.text = "Регистрация"
        }
        authView.textField.textField.text = ""
        delay(0.1) {
            self.cleanErrors()
        }
    }
}

//#if DEBUG
//
//@available(iOS 13.0, *)
//struct AuthViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        AuthViewController().showPreview()
//    }
//}
//#endif
