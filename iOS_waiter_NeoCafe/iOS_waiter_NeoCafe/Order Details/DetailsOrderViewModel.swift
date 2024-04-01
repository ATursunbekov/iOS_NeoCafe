//
//  DetailsOrderViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import Foundation

protocol DetailsOrderDelegate: AnyObject {
    func updateScreenWithSuccessfulResponse()
    func updateScreenWithFailedResponse()
}

protocol DetailsOrderViewModelProtocol {

    var delegate: DetailsOrderDelegate? {get set}

    var onBackScreenNavigate: EmptyCompletion? {get set}
    var onAddSupplementsScreenNavigate: EmptyCompletion? {get set}
    var onClosingOrderScreenNavigate: ((MockOrder)->Void)? {get set}
    
    var itemsOrdered: [ItemOrderedModel] {get set}
    
}

class DetailsOrderViewModel: DetailsOrderViewModelProtocol {
    
    var onAddSupplementsScreenNavigate: EmptyCompletion?
    
    var onBackScreenNavigate: EmptyCompletion?
    
    var onClosingOrderScreenNavigate: ((MockOrder) -> Void)?
    
    weak var delegate: DetailsOrderDelegate?
    
    var itemsOrdered = [
        ItemOrderedModel(title: "Чизкейк", quantity: 1, price: 100, milkSupplement: nil, syrupSupplement: nil),
        ItemOrderedModel(title: "Капучино", quantity: 2, price: 200, milkSupplement: nil, syrupSupplement: nil),
        ItemOrderedModel(title: "Латте", quantity: 3, price: 300, milkSupplement: nil, syrupSupplement: nil),
    ]
    
    var mockOrder = AppMockOrder.shared.mockOrder
    
}
