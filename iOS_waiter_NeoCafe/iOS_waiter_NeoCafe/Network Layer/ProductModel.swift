//
//  ProductModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

struct ProductModel: Codable, Hashable {
    let number: Int?
    let id: Int
    let name: String
    let category: String
    let description: String
    let price: Int
    let url: String
    let compositions: [СompositionModel]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct СompositionModel: Codable, Hashable {
    let name: String
    let quantity: String
    let mesure: String
}
