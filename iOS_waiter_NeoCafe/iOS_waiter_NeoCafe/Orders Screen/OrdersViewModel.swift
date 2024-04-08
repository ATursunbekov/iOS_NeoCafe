//
//  OrdersViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Foundation

protocol OrdersViewModelProtocol {
    // MARK: Navigation
    var onProfileNavigate: EmptyCompletion? { get set }
    var onNoticeNavigate: EmptyCompletion? { get set }
    var onOrderDetailsNavigate: ((MockOrder)->Void)? { get set }
    
    // MARK: Data
    var availableTables: [MockTable] { get set }
    var orderStatuses: [MockOrderStatus] { get set }
    var orders: [MockOrder] { get set }
    var ordersFiltered: [MockOrder] { get set }
    
    // MARK: Interaction
    var isOnTablesSegment: Bool { get set }
    var orderStatusSelectedIndex: Int { get set }
    
    // MARK: Methods
    func changeSegment()
    func changeSelectedIndex(with index: Int)
    func filterOrders(by status: MockOrderStatus)
}

class OrdersViewModel: OrdersViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
    // MARK: Navigation
    var onProfileNavigate: EmptyCompletion?
    var onNoticeNavigate: EmptyCompletion?
    var onOrderDetailsNavigate: ((MockOrder)->Void)?

    // MARK: Data
    var availableTables = MockData.shared.tables
    var orderStatuses: [MockOrderStatus] = MockData.shared.orderStatuses
    var orders = MockData.shared.ordersAll
    var ordersFiltered: [MockOrder] = []

    // MARK: Interaction
    var isOnTablesSegment = true
    var orderStatusSelectedIndex: Int = 0
    
    // MARK: Init
    init(selectedIndex: Int = 0) {
        self.orderStatusSelectedIndex = selectedIndex
        filterOrders(by: orderStatuses[selectedIndex])
    }
}

// MARK: - Methods
extension OrdersViewModel {
    func changeSegment() {
        isOnTablesSegment.toggle()
    }
    
    func changeSelectedIndex(with index: Int) {
        orderStatusSelectedIndex = index
        filterOrders(by: orderStatuses[index])
    }
    
    func filterOrders(by status: MockOrderStatus) {
        ordersFiltered = (status.rawValue == MockOrderStatus.allStatuses[0]) ? orders : orders.filter { $0.status == status }
    }
}

// MARK: - API requests
extension OrdersViewModel {
    // TODO:
}

