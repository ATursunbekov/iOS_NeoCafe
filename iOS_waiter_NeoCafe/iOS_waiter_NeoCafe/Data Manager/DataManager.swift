//
//  DataManager.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

class DataManager {
    static var shared = DataManager()
    
    var tokens: TokenModel = TokenModel(refreshToken: "", accessToken: "")
    
    var orderProducts: [MockProduct: Int] = [:]

    // MARK: Token getter and setter
    func setTokens(token: TokenModel) {
        self.tokens = token
    }
    
    // MARK: Orders changes
    func addProduct(product: MockProduct, quantity: Int = 1) {
        if let currentQuantity = orderProducts[product] {
            if currentQuantity != 9 {
                orderProducts[product] = currentQuantity + quantity
            }
        } else {
            orderProducts[product] = quantity
        }
    }
    
    func getQuantity(of product: MockProduct) -> Int {
        print("name: \(product.name): \(orderProducts[product] ?? 0)")
        return orderProducts[product] ?? 0
    }
    
    // Function to get an array of all products in the inventory
    func getAllProducts() -> [MockProduct] {
        return Array(orderProducts.keys)
    }
    
    func removeProduct(product: MockProduct) {
        guard let quantity = orderProducts[product], quantity > 1 else {
            // If quantity is 1 or the product isn't found, remove the product from the dictionary
            orderProducts.removeValue(forKey: product)
            return
        }
        // If quantity is greater than 1, decrease it by 1
        orderProducts[product] = quantity - 1
    }
    
    // Method to calculate the total price of all ordered products
    func calculateTotalPrice() -> Int {
        var totalPrice = 0
        for (product, quantity) in orderProducts {
            let productPrice = product.price
            totalPrice += (productPrice * quantity)
        }
        return totalPrice
    }
}
