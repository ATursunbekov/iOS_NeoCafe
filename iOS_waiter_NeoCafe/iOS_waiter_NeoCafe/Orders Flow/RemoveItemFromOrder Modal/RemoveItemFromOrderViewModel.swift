//
//  RemoveItemFromOrderModalViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 04/04/24.
//

import Foundation

protocol RemoveItemFromOrderModalViewModelProtocol {

//    var onOrderDetailsNavigate: ((MockOrder)->Void)? { get set }
    var popScreen: EmptyCompletion? { get set }
    
    var selectedItem: MockProduct? { get set }
    var order: MockOrder { get set }

    func removeSelectedItemFromOrder()
}

final class RemoveItemFromOrderModalViewModel: RemoveItemFromOrderModalViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
//    var onOrderDetailsNavigate: ((MockOrder)->Void)?
    var popScreen: EmptyCompletion?
    
    var selectedItem: MockProduct?
    var order: MockOrder = MockData.shared.order
    
//    func removeSelectedItemFromOrder() {
//        guard let selectedItem = selectedItem else {
//            return
//        }
//        
//        // Filter out the selected item from the products array
//        let updatedProducts = order.products.filter { $0 != selectedItem }
//        
//        // Create a new instance of MockOrder with the updated products array
//        let updatedOrder = MockOrder(id: order.id,
//                                     date: order.date,
//                                     time: order.time,
//                                     branch: order.branch,
//                                     status: order.status,
//                                     table: order.table,
//                                     waiter: order.waiter,
//                                     products: updatedProducts)
//        
//        // Assign the updated order back to the property
//        self.order = updatedOrder
//    }
    
    func removeSelectedItemFromOrder() {
        guard let selectedItem = selectedItem else {
            // If no item is selected, return early
            return
        }
        
        // Use the DataManager method to remove the selected product from the order
        let updatedOrder = DataManager.shared.removeProductFromOrder(product: selectedItem)
        
        // Assign the updated order back to the property
        self.order = updatedOrder
    }

}


