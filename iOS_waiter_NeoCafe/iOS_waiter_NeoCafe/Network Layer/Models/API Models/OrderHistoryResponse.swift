//
//  OrderHistoryResponse.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 02/04/24.
//

import Foundation

// MARK: - OrderHistoryResponse
struct OrderHistoryResponse: Codable {
    let active, done: [Active]
}

// MARK: - Active
struct Active: Codable {
    let id: Int
    let activeWhere, composition, date: String

    enum CodingKeys: String, CodingKey {
        case id
        case activeWhere = "where"
        case composition, date
    }
}
