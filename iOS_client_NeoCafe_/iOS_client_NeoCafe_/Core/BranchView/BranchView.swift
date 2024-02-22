//
//  BranchView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 21/2/24.
//

import UIKit
import SwiftUI

class BranchView: UIViewController {
    let branches = [
        BranchModel(name: "NeoCafe Dzerzhinka", image: Asset.branchImage.name),
        BranchModel(name: "NeoCafe Dzerzhinka", image: Asset.branchImage.name),
        BranchModel(name: "NeoCafe Dzerzhinka", image: Asset.branchImage.name),
        BranchModel(name: "NeoCafe Dzerzhinka", image: Asset.branchImage.name),
        BranchModel(name: "NeoCafe Dzerzhinka", image: Asset.branchImage.name),
        BranchModel(name: "NeoCafe Dzerzhinka", image: Asset.branchImage.name)
    ]
    
    lazy var customView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var exitButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Asset.exit.name), for: .normal)
        button.tintColor = Asset.colorWhite.color
        button.backgroundColor = Asset.colorRed.color
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "Выберите филиал"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.rowHeight = 176
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(BranchTableViewCell.self, forCellReuseIdentifier: BranchTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        exitButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    func setupConstraints() {
        view.addSubview(customView)
        customView.addSubview(exitButton)
        customView.addSubview(titleLabel)
        customView.addSubview(tableView)
        
        customView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        
        exitButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(56)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func dismissView() {
        self.dismiss(animated: false)
    }
}

extension BranchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        branches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BranchTableViewCell.identifier, for: indexPath) as! BranchTableViewCell
        cell.configureData(name: branches[indexPath.row].name, image: branches[indexPath.row].image)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item: \(indexPath.row)")
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct BranchViewControllerPreview: PreviewProvider {
    static var previews: some View {
        BranchView().showPreview()
    }
}
#endif
