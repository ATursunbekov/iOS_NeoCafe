//
//  DataManager.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

//import UIKit
//
//class DataManager {
//    static var shared = DataManager()
//    
//    var tokens: TokenModel = TokenModel(refreshToken: "", accessToken: "")
//    
//    var orderProducts: [MockProduct: Int] = [:]
//
//    // MARK: Token getter and setter
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//    
//    // MARK: Orders changes
//    func addProduct(product: MockProduct, quantity: Int = 1) {
//        if let currentQuantity = orderProducts[product] {
//            if currentQuantity != 9 {
//                orderProducts[product] = currentQuantity + quantity
//            }
//        } else {
//            orderProducts[product] = quantity
//        }
//    }
//    
//    func getQuantity(of product: MockProduct) -> Int {
//        print("name: \(product.name): \(orderProducts[product] ?? 0)")
//        return orderProducts[product] ?? 0
//    }
//    
//    // Function to get an array of all products in the inventory
//    func getAllProducts() -> [MockProduct] {
//        return Array(orderProducts.keys)
//    }
//    
//    func removeProduct(product: MockProduct) {
//        guard let quantity = orderProducts[product], quantity > 1 else {
//            // If quantity is 1 or the product isn't found, remove the product from the dictionary
//            orderProducts.removeValue(forKey: product)
//            return
//        }
//        // If quantity is greater than 1, decrease it by 1
//        orderProducts[product] = quantity - 1
//    }
//    
//    // Method to calculate the total price of all ordered products
//    func calculateTotalPrice() -> Int {
//        var totalPrice = 0
//        for (product, quantity) in orderProducts {
//            let productPrice = product.price
//            totalPrice += (productPrice * quantity)
//        }
//        return totalPrice
//    }
//}

/////////////////////////////////////
//import UIKit

//class DataManager {
//    static var shared = DataManager()
//    
//    var tokens: TokenModel = TokenModel(refreshToken: "", accessToken: "")
//    
//    var orderProducts: [MockProduct: Int] = [:]
//
//    // MARK: Token getter and setter
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//    
//    // MARK: Orders changes
//    func addProduct(product: MockProduct, quantity: Int = 1) {
//        if let currentQuantity = orderProducts[product] {
//            if currentQuantity != 9 {
//                orderProducts[product] = currentQuantity + quantity
//            }
//        } else {
//            orderProducts[product] = quantity
//        }
//    }
//    
//    func getQuantity(of product: MockProduct) -> Int {
//        print("name: \(product.name): \(orderProducts[product] ?? 0)")
//        return orderProducts[product] ?? 0
//    }
//    
//    // Function to get an array of all products in the order
//    func getAllProducts() -> [MockProduct] {
//        // Convert dictionary keys to array
//        return Array(orderProducts.keys)
//    }
//    
//    func removeProduct(product: MockProduct) {
//        guard let quantity = orderProducts[product], quantity > 1 else {
//            // If quantity is 1 or the product isn't found, remove the product from the dictionary
//            orderProducts.removeValue(forKey: product)
//            return
//        }
//        // If quantity is greater than 1, decrease it by 1
//        orderProducts[product] = quantity - 1
//    }
//    
//    // Method to calculate the total price of all ordered products
//    func calculateTotalPrice() -> Int {
//        var totalPrice = 0
//        for (product, quantity) in orderProducts {
//            let productPrice = product.price
//            totalPrice += (productPrice * quantity)
//        }
//        return totalPrice
//    }
//    
//    // MARK: - Initialization
//    private init() {
//        // Initialize orderProducts with MockData
//        for product in MockData.shared.orderProducts {
//            addProduct(product: product)
//        }
//    }
//}

import UIKit

//class DataManager {
//    static var shared = DataManager()
//    private var mockData = MockData.shared
//    
//    var tokens: TokenModel = TokenModel(refreshToken: "", accessToken: "")
//    
//    var orderProducts: [MockProduct: Int] = [:]
//
//    // MARK: Token getter and setter
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//
//    func addProduct(product: MockProduct, quantity: Int = 1) {
//        if let currentQuantity = mockData.orderProducts[product] {
//            if currentQuantity != 9 {
//                mockData.orderProducts[product] = currentQuantity + quantity
//            }
//        } else {
//            mockData.orderProducts[product] = quantity
//        }
//    }
//
//    func getQuantity(of product: MockProduct) -> Int {
//        print("name: \(product.name): \(mockData.orderProducts[product] ?? 0)")
//        return mockData.orderProducts[product] ?? 0
//    }
//
//    func getAllProducts() -> [MockProduct] {
//        return Array(mockData.orderProducts.keys)
//    }
//
//    func removeProduct(product: MockProduct) {
//        guard let quantity = mockData.orderProducts[product], quantity > 1 else {
//            mockData.orderProducts.removeValue(forKey: product)
//            return
//        }
//        mockData.orderProducts[product] = quantity - 1
//    }
//
//    func calculateTotalPrice() -> Int {
//        var totalPrice = 0
//        for (product, quantity) in mockData.orderProducts {
//            let productPrice = product.price
//            totalPrice += (productPrice * quantity)
//        }
//        return totalPrice
//    }
//}


////////////////WORKING-VERSION///////////////////////

//class DataManager {
//    static let shared = DataManager()
//    var tokens: TokenModel = TokenModel(refreshToken: "", accessToken: "")
//    var orderProducts: [MockProduct: Int] = [:]
//    
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//    
//    func addProduct(product: MockProduct, quantity: Int = 1) {
//        if let currentQuantity = orderProducts[product], currentQuantity != 9 {
//            orderProducts[product] = currentQuantity + quantity
//        } else {
//            orderProducts[product] = quantity
//        }
//    }
//    
//    func getQuantity(of product: MockProduct) -> Int {
//        return orderProducts[product] ?? 0
//    }
//    
//    func getAllProducts() -> [MockProduct] {
//        return Array(orderProducts.keys)
//    }
//    
//    func removeProduct(product: MockProduct) {
//        guard let quantity = orderProducts[product], quantity > 1 else {
//            orderProducts.removeValue(forKey: product)
//            return
//        }
//        orderProducts[product] = quantity - 1
//    }
//    
//    func calculateTotalPrice() -> Int {
//        var totalPrice = 0
//        for (product, quantity) in orderProducts {
//            let productPrice = product.price
//            totalPrice += (productPrice * quantity)
//        }
//        return totalPrice
//    }
//}

import Foundation

enum DataManagerKeys: String {
    case refreshToken
    case accessToken
    case orderProducts
}

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    
    private var orderList: [MockOrder] = []
    
    var tokens: TokenModel {
        get {
            let refreshToken = userDefaults.string(forKey: DataManagerKeys.refreshToken.rawValue) ?? ""
            let accessToken = userDefaults.string(forKey: DataManagerKeys.accessToken.rawValue) ?? ""
            return TokenModel(refreshToken: refreshToken, accessToken: accessToken)
        }
        set {
            userDefaults.set(newValue.refreshToken, forKey: DataManagerKeys.refreshToken.rawValue)
            userDefaults.set(newValue.accessToken, forKey: DataManagerKeys.accessToken.rawValue)
        }
    }
    
    func setTokens(token: TokenModel) {
        self.tokens = token
    }
    
    var orderProducts: [MockProduct: Int] {
        get {
            if let data = userDefaults.data(forKey: DataManagerKeys.orderProducts.rawValue),
               let decodedOrderProducts = try? JSONDecoder().decode([MockProduct: Int].self, from: data) {
                return decodedOrderProducts
            }
            return [:]
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                userDefaults.set(encodedData, forKey: DataManagerKeys.orderProducts.rawValue)
            }
        }
    }
    
    func addProduct(product: MockProduct, quantity: Int = 1) {
        if let currentQuantity = orderProducts[product], currentQuantity != 9 {
            orderProducts[product] = currentQuantity + quantity
        } else {
            orderProducts[product] = quantity
        }
    }
    
    
    func getQuantity(of product: MockProduct) -> Int {
        return orderProducts[product] ?? 0
    }
    
    func getAllProducts() -> [MockProduct] {
        return Array(orderProducts.keys)
    }
    
    func removeProduct(product: MockProduct) {
        guard let quantity = orderProducts[product], quantity > 1 else {
            orderProducts.removeValue(forKey: product)
            return
        }
        orderProducts[product] = quantity - 1
    }
    
    func calculateTotalPrice() -> Int {
        var totalPrice = 0
        for (product, quantity) in orderProducts {
            let productPrice = product.price
            totalPrice += (productPrice * quantity)
        }
        return totalPrice
    }
    
    func getTotal() -> Int {
        var total = 0
        for product in orderProducts.keys {
            let quantity = orderProducts[product] ?? 0
            total += product.price * quantity
        }
        return total
    }
    
    func getProducts(byCategory category: MockProductCategory) -> [MockProduct: Int] {
        let filteredProducts = orderProducts.filter { $0.key.category == category }
        return filteredProducts
    }
    
    func getOrders(byStatus status: MockOrderStatus) -> [MockOrder] {
        switch status {
        case .all:
            return orderList
        default:
            return orderList.filter { $0.status == status }
        }
    }
    
    func addProductAndUpdateTotal(product: MockProduct, quantity: Int = 1) -> Int {
        addProduct(product: product, quantity: quantity)
        let totalPrice = calculateTotalPrice()
        print("Total price after adding \(quantity) \(product.name): \(totalPrice)")
        return totalPrice
    }
}
