//
//  OrderHistoryModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/3/24.
//

import Foundation

struct OrderHistoryModel: Codable {
    let active: [OrderModel]
    let done: [OrderModel]
}

struct OrderModel: Codable {
    let id: Int
    let `where`: String
    let composition: String
    let date: String
}
