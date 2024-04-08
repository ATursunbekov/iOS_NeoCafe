//
//  OrderMock.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 27/03/24.
//

import UIKit

struct MockOrder {
    let id: Int
    let table: Int
    let time: String
    let status: OrderState
    let items: [ItemOrderedModel]

    var totalPrice: Double {
        var total: Double = 0.0
        for item in items {
            total += item.price * Double(item.quantity)
        }
        return total
    }
}


class AppMockOrder {
    static let shared = AppMockOrder()
    var mockOrder: MockOrder?

    private init() {
        let items = [
            ItemOrderedModel(title: "Coffee", 
                             quantity: 1,
                             price: 2.99,
                             milkSupplement: "Skim",
                             syrupSupplement: "Vanilla"),
            ItemOrderedModel(title: "Latte", 
                             quantity: 2,
                             price: 3.99,
                             milkSupplement: "Whole",
                             syrupSupplement: "Caramel")
        ]
        mockOrder = MockOrder(
            id: 123,
            table: 5,
            time: "2024-03-27 14:30:00",
            status: .inProcess,
            items: items
        )
    }
}
