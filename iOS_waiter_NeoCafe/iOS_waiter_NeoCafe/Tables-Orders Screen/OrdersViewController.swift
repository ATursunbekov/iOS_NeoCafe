//
//  OrdersViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit
import SnapKit

class OrdersViewController: UIViewController {
    
    var viewModel: OrdersViewModelProtocol
    let ordersView = OrdersView()
    
    init(viewModel: OrdersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ordersView
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
        ordersView.availabilityCollectionView.reloadData()
        ordersView.orderStatesCollectionView.reloadData()
        ordersView.tablesCollectionView.reloadData()
    }
    
    func setupTargets() {
        ordersView.profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        ordersView.noticeButton.addTarget(self, action: #selector(noticeButtonPressed), for: .touchUpInside)
    }
    
    func setupDelegates() {

        ordersView.availabilityCollectionView.delegate = self
        ordersView.availabilityCollectionView.dataSource = self
        
        ordersView.orderStatesCollectionView.delegate = self
        ordersView.orderStatesCollectionView.dataSource = self
        
        ordersView.tablesCollectionView.delegate = self
        ordersView.tablesCollectionView.dataSource = self
        
        ordersView.customSegmentedControl.delegate = self
        viewModel.delegate = self
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
        if collectionView == ordersView.availabilityCollectionView {
            return 1
        } else if collectionView == ordersView.orderStatesCollectionView {
            return 2
        } else if collectionView == ordersView.tablesCollectionView {
            return 1
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ordersView.availabilityCollectionView {
            return viewModel.availableTables.count
        } else if collectionView == ordersView.orderStatesCollectionView {
            return viewModel.orderStates.count
        } else if collectionView == ordersView.tablesCollectionView {
            return viewModel.tables.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == ordersView.availabilityCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailabilityCell.identifier, for: indexPath) as! AvailabilityCell
            let data = viewModel.availableTables[indexPath.item]
            cell.configureCell(with: data)
            return cell
            
        } else if collectionView == ordersView.orderStatesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderStateCell.identifier, for: indexPath) as! OrderStateCell
            
            let data = viewModel.orderStates[indexPath.item]
            cell.configureCell(with: data)
            
            if indexPath.item == viewModel.selectedIndex {
                cell.selected()
//                let orderState = viewModel.orderStates[indexPath.item]
//                viewModel.fetchTableInfoData(by: OrderState(rawValue: orderState) ?? .all)
            } else {
                cell.deselected()
            }
            return cell
            
        } else if collectionView == ordersView.tablesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as! TableCell
            let data = viewModel.tables[indexPath.item]
            cell.configureCell(with: data)
            return cell
        } else {
            print("Error: Unknown collection view")
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == ordersView.orderStatesCollectionView {
//            if indexPath.item == viewModel.selectedIndex {
//                let orderState = viewModel.orderStates[indexPath.item]
//                viewModel.fetchTableInfoData(by: OrderState(rawValue: orderState) ?? .all)
//                ordersView.tablesCollectionView.reloadData()
//            } else {
//                viewModel.selectedIndex = indexPath.item
//                collectionView.reloadData()
//            }
            
//            viewModel.selectedIndex = indexPath.item
//            collectionView.reloadData()
            
            let previousSelectedIndexPath = IndexPath(item: viewModel.selectedIndex, section: 0)
            let cell = ordersView.orderStatesCollectionView.cellForItem(at: previousSelectedIndexPath) as? OrderStateCell
            cell?.deselected()
            let chosenCell = ordersView.orderStatesCollectionView.cellForItem(at: indexPath) as? OrderStateCell
            chosenCell?.selected()
            viewModel.selectedIndex = indexPath.row
            let selectedOrderState = OrderState(rawValue: viewModel.orderStates[indexPath.item].rawValue)
            viewModel.fetchTableInfoData(by: selectedOrderState ?? .all)
            
        } else if collectionView == ordersView.tablesCollectionView {
//            let tableNumber = viewModel.tables[indexPath.item].number
//            viewModel.onDetailsNavigate?(tableNumber)
            guard let mockOrder = AppMockOrder.shared.mockOrder else { return }
            viewModel.onDetailsNavigate?(mockOrder)
        } else {
            print("Error: Unknown collection view")
        }
    }
}

// MARK: - Orders Delegate
extension OrdersViewController: OrdersDelegate {
    
    func availableTablesResponse() {
        ordersView.availabilityCollectionView.reloadData()
    }
    
    func tableInfoResponse() {
        ordersView.tablesCollectionView.reloadData()
    }
    
    func handleSuccessfulResponse() {
        ordersView.tablesCollectionView.reloadData()
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
        ordersView.colorsContainer.isHidden = true
        ordersView.availabilityCollectionView.isHidden = true
        ordersView.orderStatesCollectionView.isHidden = false
        ordersView.tablesCollectionView.isHidden = false
    }
    
    func showTablesSegmentView() {
        ordersView.colorsContainer.isHidden = false
        ordersView.availabilityCollectionView.isHidden = false
        ordersView.orderStatesCollectionView.isHidden = true
        ordersView.tablesCollectionView.isHidden = true
    }
}

// MARK: - SegmentedControlDelegate
extension OrdersViewController: SegmentedControlDelegate {
    func valueChanged(selectedIndex: Int) {
        if selectedIndex == 0 {
            self.viewModel.fetchAvailableTablesData()
            changeView(isOnOrdersSegment: false)
        } else {
            self.viewModel.fetchTableInfoData(by: .all)
            changeView(isOnOrdersSegment: true)
        }
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
