//
//  ClosingOrderModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 26/03/24.
//

import Foundation

public struct ClosingOrderModel {
    let name: String
    let pricePerItem: Int
    let quantity: Int
    
    var subtotalPrice: Int {
        return pricePerItem * quantity
    }
}
