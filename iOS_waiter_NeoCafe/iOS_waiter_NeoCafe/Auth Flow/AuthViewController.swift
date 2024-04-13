//
//  AuthViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {
    
    var timer: Timer?
    var secondsRemaining = 60
    
    var viewModel: AuthViewModelProtocol
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
        navigationController?.navigationBar.isHidden = true
        setupTargets()
        setupDelegates()
    }
    
    func setupTargets() {
        authView.button.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        
        authView.emailTextField.textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        authView.passwordTextField.textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        authView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        authView.resendButton.addTarget(self, action: #selector(resendCode), for: .touchUpInside)
    }
    
    func setupDelegates() {
        authView.emailTextField.textField.delegate = self
        authView.passwordTextField.textField.delegate = self
        
        authView.pinView.didChangeCallback = { _ in
            self.showConfirmationError(false)
        }
        viewModel.delegate = self
    }
    
    func showError(for textField: CustomTextField) {
        UIView.animate(withDuration: 0.5) {
            
            // Update the logo tint color based on the text field
            switch textField {
            case self.authView.emailTextField.textField:
                textField.logo.tintColor = UIColor.colorRed
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.colorRed.cgColor
            case self.authView.passwordTextField.textField:
                textField.logo.tintColor = UIColor.colorRed
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.colorRed.cgColor
            default:
                break
            }
            
            // Set the attributed placeholder text based on the text field
            let placeholderText: String
            switch textField {
            case self.authView.emailTextField.textField:
                placeholderText = "Неверный логин"
            case self.authView.passwordTextField.textField:
                placeholderText = "Неверный пароль"
            default:
                placeholderText = ""
            }
            textField.textField.attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [
                    .foregroundColor: UIColor.colorRed,
                    .font: UIFont.poppins(ofSize: 16, weight: .regular)
                ]
            )
            self.view.layoutIfNeeded()
        }
    }
    
    func cleanErrors(for textField: CustomTextField) {
        UIView.animate(withDuration: 0.5) {
            
            // Update the logo tint color based on the text field
            switch textField {
            case self.authView.emailTextField.textField:
                textField.logo.tintColor = UIColor.colorDarkGray
                textField.layer.borderWidth = 0
                textField.layer.borderColor = UIColor.clear.cgColor
            case self.authView.passwordTextField.textField:
                textField.logo.tintColor = UIColor.colorDarkGray
                textField.layer.borderWidth = 0
                textField.layer.borderColor = UIColor.clear.cgColor
            default:
                break
            }
            
            // Set the attributed placeholder text based on the text field
            let placeholderText: String
            switch textField {
            case self.authView.emailTextField.textField:
                placeholderText = "Введите логин"
            case self.authView.passwordTextField.textField:
                placeholderText = "Введите пароль"
            default:
                placeholderText = ""
            }
            textField.textField.attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [
                    .foregroundColor: UIColor.colorDarkGray,
                    .font: UIFont.poppins(ofSize: 16, weight: .regular)
                ]
            )
            self.view.layoutIfNeeded()
        }
    }
    
    func changeView(isOnCodeView: Bool) {
        if isOnCodeView {
            authView.topLabel.text = "Код подтверждения"
            authView.confirmationLabel.text = "Введите 4-хзначный код, \nотправленный на почту"
            authView.gmailLabel.text = "ipak.dev@gmail.com"
            authView.button.setTitle("Подтвердить", for: .normal)
            authView.button.snp.updateConstraints { make in
                make.top.equalTo(authView.topView.snp.bottom).offset(228)
            }
        } else {
            authView.topLabel.text = "Вход"
            authView.topLabel.isHidden = false
            authView.button.setTitle("Получить код", for: .normal)
            authView.button.snp.updateConstraints { make in
                make.top.equalTo(authView.topView.snp.bottom).offset(216)
            }
        }
        
        // Hide 2 text fields
        authView.emailTextField.isHidden = isOnCodeView
        authView.passwordTextField.isHidden = isOnCodeView
        
        // Reveal Code related subviews
        authView.backButton.isHidden = !isOnCodeView
        authView.confirmationLabel.isHidden = !isOnCodeView
        authView.gmailLabel.isHidden = !isOnCodeView
        authView.pinView.isHidden = !isOnCodeView
        authView.resendButton.isHidden = !isOnCodeView
        authView.timeCounter.isHidden = !isOnCodeView
        
        authView.topLabel.font = UIFont.poppins(ofSize: isOnCodeView ? 20: 32, weight: .bold)
        
        viewModel.toggleState()
        
        if !authView.underlineView.isHidden {
            showConfirmationError(false)
        }
    }
    
    // MARK: Timer logic
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func showConfirmationError(_ isErrorShown: Bool) {
        if isErrorShown {
            authView.confirmationLabel.textColor = UIColor.colorRed
            authView.confirmationLabel.text = "Код введен неверно, \nпопробуйте еще раз"
            authView.gmailLabel.isHidden = true
            authView.pinView.borderLineColor = UIColor.colorRed
            authView.resendButton.setTitleColor(UIColor.colorRed, for: .normal)
            authView.underlineView.isHidden = false
        } else {
            authView.confirmationLabel.textColor = UIColor.colorDarkGray
            authView.confirmationLabel.text = "Введите 4-хзначный код, \nотправленный на почту"
            authView.gmailLabel.text = "ipak.dev@gmail.com"
            authView.gmailLabel.isHidden = false
            authView.pinView.borderLineColor = UIColor.colorDarkGray
            authView.resendButton.setTitleColor(UIColor.colorDarkGray, for: .normal)
            authView.underlineView.isHidden = true
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        authView.timeCounter.isHidden = true
        secondsRemaining = 60
        authView.resendButton.isEnabled = true
        authView.pinView.clearPin()
        authView.gmailLabel.isHidden = true
    }
    
    @objc func resendCode() {
        viewModel.login(identifier: authView.emailTextField.textField.text ?? "", password: authView.passwordTextField.textField.text ?? "")
        startTimer()
        authView.timeCounter.isHidden = false
    }
    
    @objc func textFieldChanged() {
        if let text = authView.emailTextField.textField.text, !text.isEmpty {
            cleanErrors(for: authView.emailTextField)
        } else if let text = authView.passwordTextField.textField.text, !text.isEmpty {
            cleanErrors(for: authView.passwordTextField)
        }
    }

    @objc func nextPressed() {
        if viewModel.isOnLoginView {
            if authView.emailTextField.textField.text == "" && authView.emailTextField.textField.text != nil {
                showError(for: authView.emailTextField)
            } else if authView.passwordTextField.textField.text == "" && authView.passwordTextField.textField.text != nil {
                showError(for: authView.passwordTextField)
            } else {
                viewModel.login(identifier: authView.emailTextField.textField.text  ?? "",
                                password: authView.passwordTextField.textField.text ?? "")
            }
        } else {
            viewModel.confirmationCode(email: authView.emailTextField.textField.text ?? "",
                                       code: authView.pinView.getPin())
        }
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            authView.timeCounter.text = timeString(time: TimeInterval(secondsRemaining))
            authView.resendButton.isEnabled = false
        } else {
            timer?.invalidate()
            authView.timeCounter.isHidden = true
            secondsRemaining = 60
            authView.resendButton.isEnabled = true
        }
    }
    
    @objc func backPressed() {
        changeView(isOnCodeView: false)
        stopTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthViewController: AuthDelegate {
    
    func confirmationError() {
        showConfirmationError(true)
    }
    
    func loginError() {
        if let emailText = authView.emailTextField.textField.text, emailText.isEmpty {
            showError(for: authView.emailTextField)
        } else if let passwordText = authView.passwordTextField.textField.text, passwordText.isEmpty {
            showError(for: authView.passwordTextField)
        }
    }
    
    func loginResponse() {
        changeView(isOnCodeView: true)
        startTimer()
    }
    
    func successfulConfirmation() {
        //        navigationController?.pushViewController(CustomTabBarController(), animated: true)
        viewModel.onOrdersNavigate?()
        print("someone")
    }
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = nil
    }
}
