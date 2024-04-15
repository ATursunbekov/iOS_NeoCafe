//
//  NewOrderInfoDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderInfoDrawerViewModelProtocol {
    // MARK: Navigation
    var onOrderPlacementNavigate: EmptyCompletion? { get set }

    // MARK: Data
    var order: MockOrder { get set }
    var orderTotalPrice: Int { get set }
    
    func getTotalPrice() -> Int
    func getOrderProductsCount() -> Int
}

final class NewOrderInfoDrawerViewModel: NewOrderInfoDrawerViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    // MARK: Navigation
    var onOrderPlacementNavigate: EmptyCompletion?
    
    // MARK: Data
    var order: MockOrder = MockData.shared.order
    var orderTotalPrice: Int = 0
}

extension NewOrderInfoDrawerViewModel {
//    func getTotalPrice() -> Int {
//        var totalPrice = 0
//        for product in order.products {
//            totalPrice += (product.price * product.quantity)
//        }
//        orderTotalPrice = totalPrice
//        return totalPrice
//    }

    func getTotalPrice() -> Int {
        // Delegate the calculation to DataManager
        let totalPrice = DataManager.shared.calculateTotalPriceOfOrder()
        
        // Update the orderTotalPrice (assuming it's a property of the same object)
        orderTotalPrice = totalPrice
        
        return totalPrice
    }

    
    func getOrderProductsCount() -> Int {
        order.products.count
    }
}
