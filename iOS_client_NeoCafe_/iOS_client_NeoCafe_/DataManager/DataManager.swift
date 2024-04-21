//
//  DataManager.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/2/24.
//

import UIKit

class DataManager {
    static var shared = DataManager()

    var tokens: Token = .init(refreshToken: "", accessToken: "")
    private var branch = ""
    var showedBranches = false
    var productOrders: [PopularProductModel: Int] = [:]

    func setBranch(_ name: String) {
        branch = name
    }

    func getBranch() -> String {
        branch
    }

    // MARK: Token getter and setter

    func setTokens(token: Token) {
        tokens = token
    }

    // MARK: Orders changes

    func addProduct(product: PopularProductModel, quantity: Int = 1) {
        if let currentQuantity = productOrders[product] {
            if currentQuantity != 9 {
                productOrders[product] = currentQuantity + quantity
            }
        } else {
            productOrders[product] = quantity
        }
    }

    func getQuantity(of product: PopularProductModel) -> Int {
        return productOrders[product] ?? 0
    }

    func getAllProducts() -> [PopularProductModel] {
        return Array(productOrders.keys)
    }

    func removeProduct(product: PopularProductModel) {
        guard let quantity = productOrders[product], quantity > 1 else {
            productOrders.removeValue(forKey: product)
            return
        }
        productOrders[product] = quantity - 1
    }
}
