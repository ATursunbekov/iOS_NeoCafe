//
//  MenuCategoryProducts.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit

struct MenuCategoryProducts: Codable {
    let allCount: Int
    let responses: [PopularProductModel]
}

struct PopularProductModel: Codable, Hashable {
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
    
    static func == (lhs: PopularProductModel, rhs: PopularProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}

