//
//  DetailsOrderViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import Foundation

struct ItemOrderedModel {
    let title: String
    let quantity: Int
    let price: Double
    let milkSupplement: String
    let syrupSupplement: String
}

protocol DetailsOrderDelegate: AnyObject {
    func updateScreenWithSuccessfulResponse()
    func updateScreenWithFailedResponse()
}

protocol DetailsOrderViewModelProtocol {

    var delegate: DetailsOrderDelegate? {get set}

    var onBackScreenNavigate: EmptyCompletion? {get set}
    var onAddSupplementsScreenNavigate: EmptyCompletion? {get set}
    var onClosingAccountScreenNavigate: (([ItemOrderedModel])->Void)? {get set}
    
    var itemsOrdered: [ItemOrderedModel] {get set}
    
}

class DetailsOrderViewModel: DetailsOrderViewModelProtocol {
    
    var onAddSupplementsScreenNavigate: EmptyCompletion?
    
    var onBackScreenNavigate: EmptyCompletion?
    
    var onClosingAccountScreenNavigate: (([ItemOrderedModel]) -> Void)?
    
    var delegate: DetailsOrderDelegate?
    
    var itemsOrdered = [
        ItemOrderedModel(title: "Чизкейк", quantity: 1, price: 100),
        ItemOrderedModel(title: "Капучино", quantity: 2, price: 200),
        ItemOrderedModel(title: "Латте", quantity: 3, price: 300),
    ]
    
}
