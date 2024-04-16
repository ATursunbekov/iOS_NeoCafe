////
////  AvailabilityClickableCell.swift
////  iOS_waiter_NeoCafe
////
////  Created by iPak Tulane on 29/03/24.
////
//
//import UIKit
//import SnapKit
//
//class AvailabilityClickableCell: UICollectionViewCell {
//    static let identifier = "AvailabilityClickableCell"
//    
//    var isVacant: Bool = true
//    
//    lazy var cellView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 12
//        view.backgroundColor = UIColor.colorGray
//        view.contentMode = .scaleAspectFill
//        return view
//    }()
//    
//    lazy var numberLabel: UILabel = {
//        let label = UILabel()
//        label.text = "*"
//        label.textColor = UIColor.colorDarkBlue
//        label.font = .systemFont(ofSize: 48, weight: .semibold)
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupConstraints()
//    }
//    
//    func setupConstraints() {
//        contentView.addSubview(cellView)
//        cellView.addSubview(numberLabel)
//        
//        cellView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        numberLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
//    }
//    
//    func configureCell(with data: TableModel) {
//        
//        self.numberLabel.text = String(data.number)
//        
//        if isVacant == data.status.isVacant {
//            cellView.backgroundColor = .colorGray
//            numberLabel.textColor = UIColor.colorDarkBlue
//        } else {
//            cellView.backgroundColor = .colorGreen
//            numberLabel.textColor = UIColor.colorWhite
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
