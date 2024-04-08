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
}

class ClosingOrderDrawerViewModel: ClosingOrderDrawerViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    var onSuccessfulClosingNavigate: EmptyCompletion?
    
    var items: [MockProduct] = MockData.shared.orderProducts
    var totalPriceValue: Int = 0
}

// MARK: - CellDelegate
extension ClosingOrderDrawerViewModel: ClosingOrderCellDelegate {
    func getTotal() {
        totalPriceValue = calculateTotalPrice()
    }
}

extension ClosingOrderDrawerViewModel {
    func calculateTotalPrice() -> Int {
        for item in items {
            totalPriceValue += item.subtotalPrice
        }
        return totalPriceValue
    }
}

// MARK: - API method
extension ClosingOrderDrawerViewModel {
    // TODO:
}
