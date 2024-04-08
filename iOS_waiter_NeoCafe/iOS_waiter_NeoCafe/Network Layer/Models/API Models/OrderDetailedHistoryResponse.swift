//
//  OrderDetailedHistoryResponse.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 02/04/24.
//

import Foundation

// MARK: - OrderDetailedHistoryResponseElement
struct OrderDetailedHistoryResponseElement: Codable {
    let name: String
    let quantity, price: Int
    let imageURL: String
    let compositions: [String]

    enum CodingKeys: String, CodingKey {
        case name, quantity, price
        case imageURL = "imageUrl"
        case compositions
    }
}

typealias OrderDetailedHistoryResponse = [OrderDetailedHistoryResponseElement]
