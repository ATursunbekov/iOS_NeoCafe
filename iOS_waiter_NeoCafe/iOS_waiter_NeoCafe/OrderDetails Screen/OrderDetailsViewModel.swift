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
    
//    var totalPrice: Int { get set }
    
    func getTotalPrice() -> Int
}

class OrderDetailsViewModel: OrderDetailsViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
//    var totalPrice: Int = 0
    
    // MARK: Navigation
    var onBackNavigate: EmptyCompletion?
    var onClosingOrderNavigate: ((MockOrder)->Void)?
    var onAddSupplementsNavigate: EmptyCompletion?
    var onRemoveItemFromOrderNavigate: EmptyCompletion?
    
    // MARK: Data
    var order: MockOrder = MockData.shared.order
    var orderTotalPrice: Int = 0//MockData.shared.order.totalPrice
}

// MARK: - API requests
extension OrderDetailsViewModel {
    // TODO:
}

extension OrderDetailsViewModel {
//    func calculateTotalPrice() -> Int {
//        let total = DataManager.shared.calculateTotalPrice()
//        return total
//    }
    
    func getTotalPrice() -> Int {
        var totalPrice = 0
        for product in order.products {
            totalPrice += product.subtotalPrice
        }
        orderTotalPrice = totalPrice
        return totalPrice
    }
    
    
}


