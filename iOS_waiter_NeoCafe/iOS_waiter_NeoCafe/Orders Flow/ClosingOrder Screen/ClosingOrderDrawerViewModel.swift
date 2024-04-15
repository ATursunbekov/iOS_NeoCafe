//
//  ClosingOrderDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 26/03/24.
//

import UIKit

protocol ClosingOrderDrawerViewModelProtocol {
    var onSuccessfulClosingNavigate: EmptyCompletion? { get set }
    
    var items: [MockProduct] { get set }
    var totalPriceValue: Int { get set }
    
    func calculateTotalPrice() -> Int
    func getItemsCount() -> Int
}

class ClosingOrderDrawerViewModel: ClosingOrderDrawerViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    var onSuccessfulClosingNavigate: EmptyCompletion?
    
    var items: [MockProduct] = []
    
//    init() {
//        items = Array(MockData.shared.orderProducts.keys)
//    }

    var totalPriceValue: Int = MockData.shared.order.totalPrice
}

// MARK: - CellDelegate
extension ClosingOrderDrawerViewModel: ClosingOrderCellDelegate {
    func getTotal() {
        totalPriceValue = calculateTotalPrice()
    }
}

extension ClosingOrderDrawerViewModel {
//    func calculateTotalPrice() -> Int {
//        for item in items {
//            totalPriceValue += item.subtotalPrice
//        }
//        return totalPriceValue
//    }
    
    func calculateTotalPrice() -> Int {
        // Use the DataManager method to calculate the total price of the order
        return DataManager.shared.calculateTotalPriceOfOrder()
    }
    
    func getItemsCount() -> Int {
        items.count
    }
}
