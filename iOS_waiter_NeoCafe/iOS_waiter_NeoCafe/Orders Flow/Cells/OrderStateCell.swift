//
//  OrderStateCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 20/03/24.
//

import UIKit
import SnapKit

class OrderStateCell: UICollectionViewCell {
    static let identifier = "OrderStateCell"
    
    lazy var cellView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        view.backgroundColor = UIColor.colorGray
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "State"
        label.textColor = .colorDarkBlue
        label.textAlignment = .center
        label.font = .poppins(size: 16, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.addSubview(cellView)
        cellView.addSubview(title)
        
        cellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configureCell(with data: OrderStateModel) {
        self.title.text = data.title
    }
    
    func selected() {
        cellView.backgroundColor = .colorOrange
        title.textColor = .colorWhite
    }
    
    func deselected() {
        cellView.backgroundColor = .colorGray
        title.textColor = .colorDarkBlue
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
