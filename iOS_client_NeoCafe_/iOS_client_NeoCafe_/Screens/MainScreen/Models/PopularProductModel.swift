//
//  PopularProductModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import UIKit

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
