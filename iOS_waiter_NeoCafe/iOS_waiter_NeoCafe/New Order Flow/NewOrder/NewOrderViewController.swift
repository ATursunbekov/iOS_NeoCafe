//
//  NewOrderViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

final class NewOrderViewController: UIViewController {
    var viewModel: NewOrderViewModelProtocol
    let contentView = NewOrderView()
    
    init(viewModel: NewOrderViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupDelegates()
        setupTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        contentView.collectionView.reloadData()
    }
    
    func setupDelegates() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
    
    func setupTargets() {
        contentView.profileButton.addTarget(self, action: #selector(profileButtonDidPress), for: .touchUpInside)
        contentView.noticeButton.addTarget(self, action: #selector(noticeButtonDidPress), for: .touchUpInside)
    }
    
    @objc func profileButtonDidPress() {
        viewModel.onProfileNavigate?()
    }
    
    @objc func noticeButtonDidPress() {
        viewModel.onNoticeNavigate?()
    }
    
}

// MARK: - Collection view methods
extension NewOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == contentView.collectionView {
            return 1
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.collectionView {
            return viewModel.getTablesCount()
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == contentView.collectionView {
            
            let cell: TableCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.tables[indexPath.item]
            cell.configureCell(with: data)
            return cell
        } else {
            print("Error: Unknown collection view")
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) as? TableCell else {
//            return
//        }
        viewModel.onNewOrderDirectoryNavigate?(indexPath.row)
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct NewOrderViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        NewOrderViewController(viewModel: NewOrderViewModel()).showPreview()
//    }
//}
//#endif
