//
//  CustomSegmentedControl.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

protocol SegmentedControlDelegate: AnyObject {
    func valueChanged(selectedIndex: Int)
}

class CustomSegmentedControl: UIView {

    var selectedIndex = 0
    var delegate: SegmentedControlDelegate?

    lazy var firstButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Столы", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()

    lazy var secondButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Заказы", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()

    lazy var stackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    required init(firstOption: String? = "Столы", secondOption: String? = "Заказы") {
        super.init(frame: .zero)
        backgroundColor = .colorGray
        firstButton.setTitle(firstOption, for: .normal)
        secondButton.setTitle(secondOption, for: .normal)
        layer.cornerRadius = 24
        setupConstraints()
        setupTargets()
        updateSelectedState()
    }

    func setupConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func selectionChanges(isOnTablesSegment: Bool) {
        if isOnTablesSegment {
            firstButton.backgroundColor = UIColor.colorOrange
            firstButton.setTitleColor(UIColor.colorWhite, for: .normal)
            secondButton.backgroundColor = UIColor.colorGray
            secondButton.setTitleColor(UIColor.colorDarkBlue, for: .normal)
        } else {
            firstButton.backgroundColor = UIColor.colorGray
            firstButton.setTitleColor(UIColor.colorDarkBlue, for: .normal)
            secondButton.backgroundColor = UIColor.colorOrange
            secondButton.setTitleColor(UIColor.colorWhite, for: .normal)
        }
    }

    func setupTargets() {
        firstButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }

    func updateSelectedState() {
        selectionChanges(isOnTablesSegment: selectedIndex == 0)
        delegate?.valueChanged(selectedIndex: selectedIndex)
    }

    @objc private func optionButtonTapped(_ sender: UIButton) {
        selectedIndex = sender == firstButton ? 0 : 1
        updateSelectedState()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct OrdersViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        OrdersViewController(viewModel: OrdersViewModel()).showPreview()
//    }
//}
//#endif
