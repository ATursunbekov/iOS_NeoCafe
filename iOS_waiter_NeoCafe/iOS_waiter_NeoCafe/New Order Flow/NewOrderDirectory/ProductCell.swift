//
//  ProductCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import SnapKit

// TODO: - protocol AddButtonDelegate

protocol ProductCellDelegate: AnyObject {
    func enableOrderButton()
    func updateOrderButtonTotal()
}

class ProductCell: UICollectionViewCell {
    
    weak var delegate: ProductCellDelegate?
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.font = UIFont.poppins(ofSize: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var cost = {
        let label = UILabel()
        label.text = "(140 сом)"
        label.font = UIFont.poppins(ofSize: 16, weight: .regular)
        label.textColor = UIColor.colorLightBlue
        return label
    }()
    
    lazy var addButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.colorLightBlue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .colorWhite
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        setupConstraints()
        addButton.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
    }
    
    @objc func addButtonDidPress() {
        delegate?.enableOrderButton()
        delegate?.updateOrderButtonTotal()
        // TODO: To change items quantity in order
    }
    
    private func setupConstraints() {
        contentView.addSubview(name)
        contentView.addSubview(cost)
        contentView.addSubview(addButton)
                
        name.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(19)
        }
        
        cost.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(name.snp.trailing).offset(10)
            make.height.equalTo(19)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(28)
        }
    }

    func configureCell(with data: MockProduct) {
        self.name.text = data.name
        self.cost.text = "(\(data.price) cом)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCell: UIGestureRecognizerDelegate {
    
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct NewOrderDirectoryViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        NewOrderDirectoryViewController(viewModel: NewOrderDirectoryViewModel()).showPreview()
//    }
//}
//#endif
