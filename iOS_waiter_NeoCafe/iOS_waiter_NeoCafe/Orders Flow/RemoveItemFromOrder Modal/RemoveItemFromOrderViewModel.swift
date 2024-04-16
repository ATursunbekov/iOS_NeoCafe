//
//  RemoveItemFromOrderModalViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 04/04/24.
//

import Foundation

protocol RemoveItemFromOrderModalViewModelProtocol {
    var popScreen: EmptyCompletion? { get set }
    
    var selectedItem: MockProduct? { get set }
    var order: MockOrder { get set }

    func removeSelectedItemFromOrder()
}

final class RemoveItemFromOrderModalViewModel: RemoveItemFromOrderModalViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
    var popScreen: EmptyCompletion?
    
    var selectedItem: MockProduct?
    var order: MockOrder = MockData.shared.order
    
    func removeSelectedItemFromOrder() {
        guard let selectedItem = selectedItem else {
            return
        }
        let updatedOrder = DataManager.shared.removeProductFromOrder(product: selectedItem)
        self.order = updatedOrder
    }

}


