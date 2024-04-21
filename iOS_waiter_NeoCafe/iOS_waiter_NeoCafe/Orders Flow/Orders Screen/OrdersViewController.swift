//
//  OrdersViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit
import SnapKit

final class OrdersViewController: UIViewController {
    
    var viewModel: OrdersViewModelProtocol
    let contentView = OrdersView()
    
    init(viewModel: OrdersViewModelProtocol) {
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
        setupTargets()
        setupDelegates()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        contentView.tablesCollectionView.reloadData()
        contentView.orderStatusesCollectionView.reloadData()
        contentView.ordersCollectionView.reloadData()
    }
    
    func setupTargets() {
        contentView.profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        contentView.noticeButton.addTarget(self, action: #selector(noticeButtonPressed), for: .touchUpInside)
    }
    
    func setupDelegates() {
        contentView.tablesCollectionView.delegate = self
        contentView.tablesCollectionView.dataSource = self
        
        contentView.orderStatusesCollectionView.delegate = self
        contentView.orderStatusesCollectionView.dataSource = self
        
        contentView.ordersCollectionView.delegate = self
        contentView.ordersCollectionView.dataSource = self
        
        contentView.customSegmentedControl.delegate = self
    }
    
    @objc func profileButtonPressed() {
        viewModel.onProfileNavigate?()
    }
    
    @objc func noticeButtonPressed() {
        viewModel.onNoticeNavigate?()
    }
}

// MARK: - Collection View methods
extension OrdersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == contentView.tablesCollectionView {
            return 1
        } else if collectionView == contentView.orderStatusesCollectionView {
            return 2
        } else if collectionView == contentView.ordersCollectionView {
            return 1
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.tablesCollectionView {
            return viewModel.getAvailableTablesCount()
        } else if collectionView == contentView.orderStatusesCollectionView {
            return viewModel.getOrderStatusesCount()
        } else if collectionView == contentView.ordersCollectionView {
            return viewModel.getOrdersFilteredCount()
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == contentView.tablesCollectionView {
            
            let cell: TableCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.availableTables[indexPath.item]
            cell.configureCell(with: data)
            return cell
            
        } else if collectionView == contentView.orderStatusesCollectionView {
            
            let cell: OrderStatusCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.orderStatuses[indexPath.item]
            cell.configureCell(with: data)
            
            if indexPath.item == viewModel.orderStatusSelectedIndex {
                cell.selected()
            } else {
                cell.deselected()
            }
            return cell
            
        } else if collectionView == contentView.ordersCollectionView {
            
            let cell: OrderCell = collectionView.dequeue(for: indexPath)
            
            let data = viewModel.ordersFiltered[indexPath.item]
            cell.configureCell(with: data)
            return cell
        } else {
            print("Error: Unknown collection view")
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contentView.orderStatusesCollectionView {

            guard indexPath.item < viewModel.getOrderStatusesCount() else {
                return
            }
            
            // Store the index of the previously selected cell
            let previousSelectedIndex = viewModel.orderStatusSelectedIndex
            
            // Update the selected index
            viewModel.changeSelectedIndex(with: indexPath.item)
            
            // If the previous index is valid, deselect the previous cell
            if let previousCell = collectionView.cellForItem(at: IndexPath(item: previousSelectedIndex, section: 0)) as? OrderStatusCell {
                previousCell.deselected()
            }
            
            // Select the newly selected cell
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? OrderStatusCell {
                selectedCell.selected()
            }
            
            contentView.ordersCollectionView.reloadData()
            
        } else if collectionView == contentView.ordersCollectionView {
            let selectedOrder = viewModel.ordersFiltered[indexPath.item]
            viewModel.onOrderDetailsNavigate?(selectedOrder)
        }
    }
}

// MARK: - Change Segments
extension OrdersViewController {
    func changeView(isOnOrdersSegment: Bool) {
        DispatchQueue.main.async {
            if isOnOrdersSegment {
                self.showOrdersSegmentView()
            } else {
                self.showTablesSegmentView()
            }
        }
        viewModel.changeSegment()
    }
    
    func showOrdersSegmentView() {
        contentView.colorsContainer.isHidden = true
        contentView.tablesCollectionView.isHidden = true
        contentView.orderStatusesCollectionView.isHidden = false
        contentView.ordersCollectionView.isHidden = false
    }
    
    func showTablesSegmentView() {
        contentView.colorsContainer.isHidden = false
        contentView.tablesCollectionView.isHidden = false
        contentView.orderStatusesCollectionView.isHidden = true
        contentView.ordersCollectionView.isHidden = true
    }
}

// MARK: - SegmentedControlDelegate
extension OrdersViewController: SegmentedControlDelegate {
    func valueChanged(selectedIndex: Int) {
        if selectedIndex == 0 {
            changeView(isOnOrdersSegment: false)
        } else {
            changeView(isOnOrdersSegment: true)
        }
    }
}
