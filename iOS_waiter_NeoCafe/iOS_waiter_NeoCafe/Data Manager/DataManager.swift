//
//  DataManager.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Foundation

enum DataManagerKeys: String {
    case refreshToken
    case accessToken
    case orderProducts
}

class DataManager {
    static let shared = DataManager()
    var mockData: MockData = MockData.shared
    private let userDefaults = UserDefaults.standard
    
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
    
    private init() {}
    
    func setTokens(token: TokenModel) {
        self.tokens = token
    }
    
    func addProduct(product: MockProduct, quantity: Int = 1) {
        if let currentQuantity = mockData.order.products[product] {
            mockData.order.products[product] = currentQuantity + quantity
        } else {
            mockData.order.products[product] = quantity
        }
    }
    
    func deductProduct(product: MockProduct, quantity: Int = 1) {
        if let currentQuantity = mockData.order.products[product], currentQuantity > quantity {
            mockData.order.products[product] = currentQuantity - quantity
        } else {
            mockData.order.products[product] = 0
        }
    }
    
    func removeProductFromOrder(product: MockProduct) -> MockOrder {
        mockData.order.products[product] = nil
        return mockData.order
    }
    
    func getQuantity(of product: MockProduct) -> Int {
        return mockData.order.products[product] ?? 0
    }
    
    func getAllProducts() -> [MockProduct] {
        return mockData.menuProducts
    }
    
    func calculateTotalPriceOfOrder() -> Int {
        var total = 0
        for (product, quantity) in mockData.order.products {
            total += product.price * quantity
        }
        return total
    }
    
    func calculateSubtotalPriceOfProduct(product: MockProduct, quantity: Int) -> Int {
        return product.price * quantity
    }
    
    func getProductsFiltered(by category: MockProductCategory) -> [MockProduct] {
        return mockData.menuProducts.filter { $0.category == category }
    }

    func getOrdersFiltered(by status: MockOrderStatus) -> [MockOrder] {
        return mockData.ordersAll.filter { $0.status == status }
    }
    
    func createOrder() {
        let newOrder = MockOrder(
            id: mockData.ordersAll.count + 1,
            date: Date().description,
            time: Date().description,
            branch: nil,
            status: .new,
            table: mockData.tables[0],
            waiter: "Alex",
            products: [:]
        )
        mockData.ordersAll.append(newOrder)
    }
    
    func searchProduct(by name: String) -> MockProduct? {
        let filteredProducts = mockData.menuProducts.filter { $0.name.lowercased() == name.lowercased() }
        return filteredProducts.first
    }
}
