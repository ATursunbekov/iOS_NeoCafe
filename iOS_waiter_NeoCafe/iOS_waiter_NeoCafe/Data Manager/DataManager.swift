//
//  DataManager.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

class DataManager {
    
    static var shared = DataManager()
    
    var tokens: Token = Token(refreshToken: "", accessToken: "")
    private var branch = ""
    var showedBranches = false
    var productOrders: [ProductModel: Int] = [:]
    
    func setBranch(_ name: String) {
        branch = name
    }
    
    func getBranch() -> String {
        branch
    }
    
    // MARK: Token getter and setter
    func setTokens(token: Token) {
        self.tokens = token
    }
    
    // MARK: Orders changes
    func addProduct(product: ProductModel, quantity: Int = 1) {
        if let currentQuantity = productOrders[product] {
            if currentQuantity != 9 {
                productOrders[product] = currentQuantity + quantity
            }
        } else {
            productOrders[product] = quantity
        }
    }
    
    func getQuantity(of product: ProductModel) -> Int {
        print("name: \(product.name): \(productOrders[product] ?? 0)")
        return productOrders[product] ?? 0
    }
    
    // Function to get an array of all products in the inventory
    func getAllProducts() -> [ProductModel] {
        return Array(productOrders.keys)
    }
    
    func removeProduct(product: ProductModel) {
        guard let quantity = productOrders[product], quantity > 1 else {
            // If quantity is 1 or the product isn't found, remove the product from the dictionary
            productOrders.removeValue(forKey: product)
            return
        }
        // If quantity is greater than 1, decrease it by 1
        productOrders[product] = quantity - 1
    }
}
