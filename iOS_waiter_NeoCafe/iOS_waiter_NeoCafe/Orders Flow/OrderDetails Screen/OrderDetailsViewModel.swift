//
//  OrderDetailsViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import Foundation

protocol OrderDetailsViewModelProtocol {
    // MARK: Navigation
    var onBackNavigate: EmptyCompletion? { get set }
    var onClosingOrderNavigate: ((MockOrder)->Void)? { get set }
    var onAddSupplementsNavigate: EmptyCompletion? { get set }
    var onRemoveItemFromOrderNavigate: ((MockOrder)->Void)? { get set }
    
    // Indexes
    var removedProductSelectedIndex: Int { get set }
    
    // MARK: Data
    var product: MockProduct? { get set }
    var order: MockOrder { get set }
    var orderTotalPrice: Int { get set }
    
    func getTotalPrice() -> Int
    func getOrderProductsCount() -> Int
    func changeSelectedIndex(for index: Int)
    func removeItemFromOrder()
}

class OrderDetailsViewModel: OrderDetailsViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
    var product: MockProduct?
    
    func removeItemFromOrder() {
        let index = removedProductSelectedIndex
        if index < order.products.count {
            return
        }
        let removedProduct = Array(order.products.keys)[index]
        let updatedOrder = DataManager.shared.removeProductFromOrder(product: removedProduct)
        order = updatedOrder
    }
    
    func changeSelectedIndex(for index: Int) {
        removedProductSelectedIndex = index
    }
    
    var removedProductSelectedIndex: Int = 0
    
    // MARK: Navigation
    var onBackNavigate: EmptyCompletion?
    var onClosingOrderNavigate: ((MockOrder)->Void)?
    var onAddSupplementsNavigate: EmptyCompletion?
    var onRemoveItemFromOrderNavigate: ((MockOrder)->Void)?
    
    // MARK: Data
    var order: MockOrder = MockData.shared.order
    var orderTotalPrice: Int = 0
}

extension OrderDetailsViewModel {
    func getTotalPrice() -> Int {
        let totalPrice = DataManager.shared.calculateTotalPriceOfOrder()
        orderTotalPrice = totalPrice
        return totalPrice
    }
    
    func getOrderProductsCount() -> Int {
        order.products.count
    }
}


