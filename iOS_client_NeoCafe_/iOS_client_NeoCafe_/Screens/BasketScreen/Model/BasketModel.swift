//
//  BasketModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/3/24.
//

import Foundation

struct BasketModel: Codable {
    let price: Int
    let filialId: Int
    let orderDetails: [OrderDetailModel]
}

struct OrderDetailModel: Codable {
    let productId: Int
    let quantity: Int
    let additions: [String]
}
