//
//  OrderStatus.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Foundation

struct OrderModel {
    let id: Int
    let tableNumber: Int
    let orderState: OrderState
    let time: String
}

//struct OrderStateModel {
//    let title: String
//}

enum OrderState: String {
    case all = "Все"
    case new = "Новые"
    case inProcess = "В процессе"
    case ready = "Готово"
    case cancelled = "Отменено"
    case finished = "Завершено"
}
