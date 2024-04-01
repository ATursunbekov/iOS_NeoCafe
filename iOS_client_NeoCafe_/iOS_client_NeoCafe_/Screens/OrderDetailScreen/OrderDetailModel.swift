//
//  Model.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 29/3/24.
//

import Foundation

struct OrderHistoryDetailModel: Codable {
    let name: String
    let quantity: Int
    let price: Int
    let imageUrl: String
    let compositions: [String]
}
