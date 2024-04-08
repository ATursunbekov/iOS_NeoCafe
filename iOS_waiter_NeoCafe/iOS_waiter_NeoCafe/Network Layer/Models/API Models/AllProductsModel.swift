// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - AllProductsModel
struct AllProductsModel: Codable {
    let allCount: Int
    let responses: [Response]
}

// MARK: - Response
struct Response: Codable {
    let id: Int
    let number: Int
    let name: String
    let description: String
    let category: String
    let price: Int
    let url: String
    let compositions: [Composition]
}

// MARK: - Composition
struct Composition: Codable {
    let name: String
    let quantity: String
    let mesure: String
}
