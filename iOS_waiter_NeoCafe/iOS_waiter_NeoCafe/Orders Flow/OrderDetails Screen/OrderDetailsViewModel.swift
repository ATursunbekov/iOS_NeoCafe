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
    var onRemoveItemFromOrderNavigate: EmptyCompletion? { get set }
    
    // MARK: Data
    var order: MockOrder { get set }
    var orderTotalPrice: Int { get set }
    
    func getTotalPrice() -> Int
    func getOrderProductsCount() -> Int
}

class OrderDetailsViewModel: OrderDetailsViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
    // MARK: Navigation
    var onBackNavigate: EmptyCompletion?
    var onClosingOrderNavigate: ((MockOrder)->Void)?
    var onAddSupplementsNavigate: EmptyCompletion?
    var onRemoveItemFromOrderNavigate: EmptyCompletion?
    
    // MARK: Data
    var order: MockOrder = MockData.shared.order
    var orderTotalPrice: Int = 0
}

extension OrderDetailsViewModel {
    func getTotalPrice() -> Int {
        var totalPrice = 0
        for product in order.products {
            totalPrice += (product.price * product.quantity)
        }
        orderTotalPrice = totalPrice
        return totalPrice
    }
    
    func getOrderProductsCount() -> Int {
        order.products.count
    }
}


