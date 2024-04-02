//
//  OrdersAPI.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import Moya

enum OrdersAPI {
    case orderHistory
    case orderDetailedHistory(orderId: Int)
    
    case waiterMakeOrder(tableId: Int, price: Int, filialId: Int, orderDetails: [OrderDetail])
    case orderCancelStaff(orderId: Int)
    case orderCloseStaff(orderId: Int)
}

struct OrderDetail: Codable {
    let productId: Int
    let quantity: Int
    let additions: [String]
}

extension OrdersAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/order")!
    }
    
    var path: String {
        switch self {
        case .orderHistory:
            return "/order-history"
        case .orderDetailedHistory(let orderId):
            return "/order-detailed-history/\(orderId)"
            
        case .waiterMakeOrder:
            return "/waiter-make-order"
        case .orderCancelStaff(let orderId):
            return "/order-cancel-staff/\(orderId)"
        case .orderCloseStaff(let orderId):
            return "/order-close-staff/\(orderId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .orderDetailedHistory, .orderHistory:
            return .get
            
        case .waiterMakeOrder:
            return .post
        case .orderCancelStaff, .orderCloseStaff:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .orderDetailedHistory, .orderHistory:
            return .requestPlain
            
        case .waiterMakeOrder(let tableId, let price, let filialId, let orderDetails):
            let parameters: [String: Any] = ["tableId": tableId,
                                              "price": price,
                                              "filialId": filialId,
                                              "orderDetails": orderDetails]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .orderCancelStaff, .orderCloseStaff:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .orderDetailedHistory, .orderHistory:
            return ["accept": "application/json"]
            
        case .waiterMakeOrder:
            return ["accept": "*/*", "Content-Type": "application/json"]
        case .orderCancelStaff, .orderCloseStaff:
            return ["accept": "*/*"]
        }
    }
}
