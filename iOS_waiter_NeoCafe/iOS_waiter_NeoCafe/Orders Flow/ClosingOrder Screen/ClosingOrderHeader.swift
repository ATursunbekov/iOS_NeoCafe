//
//  ClosingOrderHeader.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 25/03/24.
//

import UIKit
import SnapKit

class ClosingOrderHeader: UICollectionReusableView {
    
    lazy var stackHorizontal = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .top
        stack.spacing = 48
        return stack
    }()
    
    lazy var itemNameHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "Наименование"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var itemQuantityHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "Кол-во"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var itemSubtotalPriceHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "Сумма"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.poppins(ofSize: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        addSubview(stackHorizontal)
        stackHorizontal.addArrangedSubview(itemNameHeaderTitle)
        stackHorizontal.addArrangedSubview(itemQuantityHeaderTitle)
        stackHorizontal.addArrangedSubview(itemSubtotalPriceHeaderTitle)
        
        stackHorizontal.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()//.inset(16)
            make.height.equalTo(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct ClosingOrderDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        ClosingOrderDrawerViewController(viewModel: ClosingOrderDrawerViewModel()).showPreview()
//    }
//}
//#endif
