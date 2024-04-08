//
//  TableCell.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 20/03/24.
//

import UIKit
import SnapKit

class TableCell: UICollectionViewCell {
    static let identifier = "TableCell"
    
    lazy var cellView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.colorWhite
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.colorGray.cgColor
        return view
    }()
    
    lazy var tableLabel: UILabel = {
        let label = UILabel()
        label.text = "Стол №..."
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 20, weight: .bold)
        return label
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.colorRed
        return view
    }()
    
    lazy var orderStateLabel: UILabel = {
        let label = UILabel()
        label.text = "Статус не определен"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 16, weight: .regular)
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        let id = ""
        label.text = "№\(id)"
        label.textAlignment = .right
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
        label.font = .poppins(size: 16, weight: .semibold)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .right
        label.numberOfLines = 1
        label.textColor = .colorDarkBlue
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
        cellView.addSubview(tableLabel)
        cellView.addSubview(circleView)
        cellView.addSubview(orderStateLabel)
        cellView.addSubview(idLabel)
        cellView.addSubview(timeLabel)
        
        cellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        circleView.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(16)
        }
        
        orderStateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(circleView.snp.trailing).offset(10)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
    }
    
    func configureCell(with data: TableInfoModel) {
        self.tableLabel.text = "Стол №\(data.number)"
        self.orderStateLabel.text = data.orderState.rawValue
        self.idLabel.text = String(data.id)
        self.timeLabel.text = data.time
        
        // Determine the color based on the order state
        switch OrderState(rawValue: data.orderState.rawValue) {
        case .inProcess:
            self.circleView.backgroundColor = UIColor.colorYellow
        case .new:
            self.circleView.backgroundColor = UIColor.colorSkyBlue
        case .ready:
            self.circleView.backgroundColor = UIColor.colorGreen
        case .cancelled:
            self.circleView.backgroundColor = UIColor.colorDarkBlue
        default: // .finished
            self.circleView.backgroundColor = UIColor.colorGray
        }
    }
}

