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
    
    var viewModel: AuthViewModelProtocol
    let authView = AuthView()   
    
    var timer: Timer?
    var secondsRemaining = 60
    
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
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupTargets() {
        authView.button.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        authView.textField.textField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        authView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        authView.resendButton.addTarget(self, action: #selector(resendCode), for: .touchUpInside)
    }
    
    func setDelegates() {
        authView.customSegmentedControl.delegate = self
        authView.pinView.didChangeCallback = { _ in
            self.showConfirmationError(false)
        }
        viewModel.delegate = self
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
            self.authView.textField.textField.attributedPlaceholder = NSAttributedString(string: Str.enterEmail, attributes:
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
            self.authView.textField.textField.attributedPlaceholder = NSAttributedString(string: Str.enterEmail, attributes:
                                                                                            [
                                                                                                .foregroundColor: Asset.colorRed.color,
                                                                                                .font: UIFont(name: FontFamily.Poppins.regular.name, size: 16) ?? UIFont.systemFont(ofSize: 16)
                                                                                            ]
            )
        }
    }
    
    func changeState(isSecond: Bool) {
        if isSecond {
            authView.titleLabel.text = Str.verificationCode
            authView.button.setTitle(Str.confirm, for: .normal)
            authView.button.snp.updateConstraints { make in
                make.top.equalTo(authView.textField.snp.bottom).offset(116)
            }
        } else {
            authView.titleLabel.text = authView.customSegmentedControl.selectedIndex == 0 ? Str.entry : Str.registration
            authView.button.setTitle(Str.getCode, for: .normal)
            authView.button.snp.updateConstraints { make in
                make.top.equalTo(authView.textField.snp.bottom).offset(56)
            }
        }
        
        authView.backButton.isHidden = !isSecond
        authView.confirmationLabel.isHidden = !isSecond
        authView.gmailLabel.isHidden = !isSecond
        authView.resendButton.isHidden = !isSecond
        authView.timeCounter.isHidden = !isSecond
        authView.pinView.isHidden = !isSecond
        authView.textField.isHidden = isSecond
        authView.titleLabel.font = UIFont(name: FontFamily.Poppins.bold.name, size: isSecond ? 20: 32)
        viewModel.changeState()
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
    //END
    
    func showConfirmationError(_ show: Bool) {
        if show {
            authView.confirmationLabel.textColor = Asset.colorRed.color
            authView.confirmationLabel.text = Str.wrongCode
            authView.gmailLabel.isHidden = true
            authView.pinView.borderLineColor = Asset.colorRed.color
            authView.resendButton.setTitleColor(Asset.colorRed.color, for: .normal)
            authView.underlineView.isHidden = false
        } else {
            authView.confirmationLabel.textColor = Asset.colorDarkBlue.color;         authView.confirmationLabel.text = Str.otpCodeLabel
            authView.gmailLabel.isHidden = false
            authView.pinView.borderLineColor = Asset.colorDarkBlue.color
            authView.resendButton.setTitleColor(Asset.colorDarkBlue.color, for: .normal)
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
        if authView.customSegmentedControl.selectedIndex == 0 {
            viewModel.signIn(email: authView.textField.textField.text ?? "")
        } else {
            viewModel.signUp(email: authView.textField.textField.text ?? "")
        }
        startTimer()
        authView.timeCounter.isHidden = false
    }
    
    @objc func textFieldChanged(_ sender: UITextField) {
        if sender.text != "" && sender.text != nil {
            cleanErrors()
        }
    }
    
    @objc func nextPressed() {
        if viewModel.firstState {
            if authView.textField.textField.text == "" && authView.textField.textField.text != nil {
                showError()
            } else {
                if authView.customSegmentedControl.selectedIndex == 0 {
                    viewModel.signIn(email: authView.textField.textField.text ?? "")
                } else {
                    viewModel.signUp(email: authView.textField.textField.text ?? "")
                }
            }
        } else {
            viewModel.confirmationCode(email: authView.textField.textField.text ?? "", code: authView.pinView.getPin())
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
        changeState(isSecond: false)
        stopTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthViewController: SegmentedControlDelegate {
    func valueChanged(selectedIndex: Int) {
        authView.titleLabel.text = selectedIndex == 0 ? Str.entry : Str.registration
        authView.textField.textField.text = ""
        delay(0.1) {
            self.cleanErrors()
            self.stopTimer()
        }
        if !viewModel.firstState {
            changeState(isSecond: false)
        }
    }
}

extension AuthViewController: AuthDelegate {
    func confirmationError() {
        showConfirmationError(true)
    }
    
    func emailError() {
        showError()
    }
    
    func signUpResponse() {
        changeState(isSecond: true)
        startTimer()
    }
    
    func signInResponse() {
        changeState(isSecond: true)
        startTimer()
    }
    
    func successfulConfirmation() {
//        navigationController?.pushViewController(CustomTabBarController(), animated: true)
//        viewModel.onAuthNavigate
        print("someone")
    }
}
