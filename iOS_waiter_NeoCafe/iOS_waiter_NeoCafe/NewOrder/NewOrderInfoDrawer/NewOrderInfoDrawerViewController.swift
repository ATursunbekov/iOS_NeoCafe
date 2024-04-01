//
//  NewOrderInfoDrawerViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

class NewOrderInfoDrawerViewController: UIViewController {
    
    var isCoffeeCategory: Bool = true
//    var chooseMilk = 0
//    var chooseSyrup = 0
    private var tapAction: (() -> Void)?
    
    init(tapAction: ( () -> Void)? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.tapAction = tapAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var drawerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorLightBlue
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Заказ №..."
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = .colorWhite
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 56 //102
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(NewOrderInfoDrawerCell.self, forCellReuseIdentifier: NewOrderInfoDrawerCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 8, right: 0)
        return tableView
    }()
    
    lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.textAlignment = .left
        label.font = .poppins(size: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "... сум"
        label.textAlignment = .left
        label.font = .poppins(size: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    

    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorLightBlue
        button.titleLabel?.font = .poppins(size: 16, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        setupTargets()
        setupConstraints()
    }

    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    func setupTargets() {
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc func saveButtonPressed() {
        dismiss(animated: false)
        tapAction?()
    }
    
    func setupConstraints() {
        view.addSubview(backgroundView)
        view.addSubview(drawerView)
        drawerView.addSubview(headerTitle)
        drawerView.addSubview(tableView)
        drawerView.addSubview(totalTextLabel)
        drawerView.addSubview(totalNumberLabel)
        drawerView.addSubview(saveButton)
        
        drawerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(537)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.height.equalTo(29)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerTitle.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(totalTextLabel.snp.top).offset(24)
        }
        
        totalTextLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(saveButton.snp.top).offset(16)
            make.height.equalTo(19)
        }
        
        totalNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(totalTextLabel.snp.top)
            make.leading.equalTo(totalTextLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
                
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
    }
}


//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct CoffeeSupplementsDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        CoffeeSupplementsDrawerViewController().showPreview()
//    }
//}
//#endif
