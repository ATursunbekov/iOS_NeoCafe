//
//  BonusViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/2/24.
//

import SwiftUI
import UIKit

protocol BonusViewDelegate: AnyObject {
    func makeOrder(bonus: Int)
}

class BonusViewController: UIViewController {
    var statusNumber = 0
    var viewModel: BonusViewModelProtocol
    var delegate: BonusViewDelegate?

    init(viewModel: BonusViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: First popup

    lazy var popup1: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorWhite.color
        view.layer.cornerRadius = 16
        return view
    }()

    lazy var titleLabel1: UILabel = {
        let label = UILabel()
        label.text = Str.takeBonus
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()

    lazy var descriptionLabel1: UILabel = {
        let label = UILabel()
        label.text = "У вас есть ? бонусов, хотите использовать их?"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .poppins(size: 14, weight: .medium)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()

    lazy var cancelButton1: UIButton = {
        let button = UIButton()
        button.setTitle(Str.no, for: .normal)
        button.setTitleColor(Asset.colorDarkBlue.color, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.layer.borderColor = Asset.colorDarkBlue.color.cgColor
        button.layer.borderWidth = 2
        return button
    }()

    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.yes, for: .normal)
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = Asset.colorDarkBlue.color
        return button
    }()

    // MARK: second popup

    lazy var popup2: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorWhite.color
        view.layer.cornerRadius = 16
        return view
    }()

    lazy var titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Ваши бонусы: ?"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()

    lazy var descriptionLabel2: UILabel = {
        let label = UILabel()
        label.text = Str.takeBonusDescription
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .poppins(size: 14, weight: .medium)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Asset.colorDarkGray.color,
            .font: UIFont(name: FontFamily.Poppins.regular.name, size: 15) ?? UIFont.systemFont(ofSize: 15),
        ]
        textField.font = UIFont(name: FontFamily.Poppins.regular.name, size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Enter amount of bonus", attributes: attributes)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        textField.backgroundColor = Asset.colorGray.color
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        return textField
    }()

    lazy var cancelButton2: UIButton = {
        let button = UIButton()
        button.setTitle(Str.cancel, for: .normal)
        button.setTitleColor(Asset.colorDarkBlue.color, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.layer.borderColor = Asset.colorDarkBlue.color.cgColor
        button.layer.borderWidth = 2
        return button
    }()

    lazy var takeBonusButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.takeBonusButtonTitle, for: .normal)
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = Asset.colorDarkBlue.color
        return button
    }()

    // MARK: last popupView

    lazy var popup3: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorWhite.color
        view.layer.cornerRadius = 16
        return view
    }()

    lazy var titleLabel3: UILabel = {
        let label = UILabel()
        label.text = Str.takeBonus
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()

    lazy var descriptionLabel3: UILabel = {
        let label = UILabel()
        label.text = Str.orderConfirmationDescription
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .poppins(size: 14, weight: .medium)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()

    lazy var finishButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.well, for: .normal)
        button.setTitleColor(Asset.colorWhite.color, for: .normal)
        button.titleLabel?.font = .poppins(size: 16, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = Asset.colorDarkBlue.color
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupConstraints()
        setupTargets()
        updateView()
        viewModel.delegate = self
        viewModel.getProfileData()
    }

    func setupConstraints() {
        view.addSubview(popup1)
        popup1.addSubview(titleLabel1)
        popup1.addSubview(descriptionLabel1)
        popup1.addSubview(cancelButton1)
        popup1.addSubview(confirmButton)

        popup1.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(197)
            make.width.equalTo(343)
        }

        titleLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }

        descriptionLabel1.snp.makeConstraints { make in
            make.top.equalTo(titleLabel1.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        cancelButton1.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }

        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel1.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }

        popup1.isHidden = true

        // MARK: second popup View

        view.addSubview(popup2)
        popup2.addSubview(titleLabel2)
        popup2.addSubview(descriptionLabel2)
        popup2.addSubview(cancelButton2)
        popup2.addSubview(takeBonusButton)
        popup2.addSubview(textField)

        popup2.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(265)
            make.width.equalTo(343)
        }

        titleLabel2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }

        descriptionLabel2.snp.makeConstraints { make in
            make.top.equalTo(titleLabel2.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        textField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel2.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }

        cancelButton2.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }

        takeBonusButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(54)
            make.width.equalTo(141)
        }

        popup2.isHidden = true

        // MARK: last popup View

        view.addSubview(popup3)
        popup3.addSubview(titleLabel3)
        popup3.addSubview(descriptionLabel3)
        popup3.addSubview(finishButton)

        popup3.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(196)
            make.width.equalTo(343)
        }

        titleLabel3.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }

        descriptionLabel3.snp.makeConstraints { make in
            make.top.equalTo(titleLabel3.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        finishButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(descriptionLabel3.snp.bottom).offset(32)
            make.height.equalTo(54)
        }

        popup3.isHidden = true
    }

    func setupTargets() {
        confirmButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        takeBonusButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        cancelButton1.addTarget(self, action: #selector(goBackPressed), for: .touchUpInside)
        cancelButton2.addTarget(self, action: #selector(goBackPressed), for: .touchUpInside)
    }

    func updateView() {
        if statusNumber == 0 {
            popup1.isHidden = false
            popup2.isHidden = true
            popup3.isHidden = true
        } else if statusNumber == 1 {
            popup1.isHidden = true
            popup2.isHidden = false
            popup3.isHidden = true
        } else {
            popup1.isHidden = true
            popup2.isHidden = true
            popup3.isHidden = false
        }
    }

    @objc func goBackPressed() {
        if statusNumber == 0 {
            delegate?.makeOrder(bonus: 0)
            dismiss(animated: false)
        } else {
            statusNumber -= 1
            updateView()
        }
    }

    @objc func goForward() {
        if statusNumber < 2 {
            statusNumber += 1
            updateView()
            if statusNumber == 2 {
                if let text = textField.text, let num = Int(text) {
                    let finalAmount = viewModel.bonusAmount > num ? num : viewModel.bonusAmount
                    delegate?.makeOrder(bonus: finalAmount)
                }
            }
        } else {
            dismiss(animated: false)
        }
    }
}

extension BonusViewController: BonusViewModelDelegate {
    func updateData() {
        titleLabel2.text = "Ваши бонусы: \(viewModel.bonusAmount)"
        descriptionLabel1.text = "У вас есть \(viewModel.bonusAmount) бонусов, хотите использовать их?"
    }
}
