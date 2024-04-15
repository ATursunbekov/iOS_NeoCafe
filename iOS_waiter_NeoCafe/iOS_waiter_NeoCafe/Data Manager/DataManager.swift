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

//import UIKit

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

//import UIKit
//
//enum DataManagerKeys: String {
//    case refreshToken
//    case accessToken
//    case orderProducts
//}
//
//class DataManager {
//    static let shared = DataManager()
//    private let userDefaults = UserDefaults.standard
//    
//    private var orderList: [MockOrder] = []
//    
//    var tokens: TokenModel {
//        get {
//            let refreshToken = userDefaults.string(forKey: DataManagerKeys.refreshToken.rawValue) ?? ""
//            let accessToken = userDefaults.string(forKey: DataManagerKeys.accessToken.rawValue) ?? ""
//            return TokenModel(refreshToken: refreshToken, accessToken: accessToken)
//        }
//        set {
//            userDefaults.set(newValue.refreshToken, forKey: DataManagerKeys.refreshToken.rawValue)
//            userDefaults.set(newValue.accessToken, forKey: DataManagerKeys.accessToken.rawValue)
//        }
//    }
//    
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//    
//    var orderProducts: [MockProduct: Int] {
//        get {
//            if let data = userDefaults.data(forKey: DataManagerKeys.orderProducts.rawValue),
//               let decodedOrderProducts = try? JSONDecoder().decode([MockProduct: Int].self, from: data) {
//                return decodedOrderProducts
//            }
//            return [:]
//        }
//        set {
//            if let encodedData = try? JSONEncoder().encode(newValue) {
//                userDefaults.set(encodedData, forKey: DataManagerKeys.orderProducts.rawValue)
//            }
//        }
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
//    
//    func getTotal() -> Int {
//        var total = 0
//        for product in orderProducts.keys {
//            let quantity = orderProducts[product] ?? 0
//            total += product.price * quantity
//        }
//        return total
//    }
//    
//    func getProducts(byCategory category: MockProductCategory) -> [MockProduct: Int] {
//        let filteredProducts = orderProducts.filter { $0.key.category == category }
//        return filteredProducts
//    }
//    
//    func getOrders(byStatus status: MockOrderStatus) -> [MockOrder] {
//        switch status {
//        case .all:
//            return orderList
//        default:
//            return orderList.filter { $0.status == status }
//        }
//    }
//    
//    func addProductAndUpdateTotal(product: MockProduct, quantity: Int = 1) -> Int {
//        addProduct(product: product, quantity: quantity)
//        let totalPrice = calculateTotalPrice()
//        print("Total price after adding \(quantity) \(product.name): \(totalPrice)")
//        return totalPrice
//    }
//}
    
//    func removeProductFromOrder(product: MockProduct) -> MockOrder {
//        removeProduct(product: product)
//        return MockOrder(products: orderProducts)
//    }


//    func removeProduct(product: MockProduct) -> MockOrder {
//        var updatedProducts = orderProducts
//
//        guard let quantity = updatedProducts[product], quantity > 1 else {
//            updatedProducts.removeValue(forKey: product)
//            let updatedOrder = MockOrder(products: updatedProducts)
//            return updatedOrder
//        }
//
//        updatedProducts[product] = quantity - 1
//        let updatedOrder = MockOrder(products: updatedProducts)
//        return updatedOrder
//    }

//import UIKit
//
//enum DataManagerKeys: String {
//    case refreshToken
//    case accessToken
//    case orderProducts
//}
//
//class DataManager {
//    static let shared = DataManager()
//    private let userDefaults = UserDefaults.standard
//    
//    private var orderList: [MockOrder] = []
//    
//    var tokens: TokenModel {
//        get {
//            let refreshToken = userDefaults.string(forKey: DataManagerKeys.refreshToken.rawValue) ?? ""
//            let accessToken = userDefaults.string(forKey: DataManagerKeys.accessToken.rawValue) ?? ""
//            return TokenModel(refreshToken: refreshToken, accessToken: accessToken)
//        }
//        set {
//            userDefaults.set(newValue.refreshToken, forKey: DataManagerKeys.refreshToken.rawValue)
//            userDefaults.set(newValue.accessToken, forKey: DataManagerKeys.accessToken.rawValue)
//        }
//    }
//    
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//    
//    var orderProducts: [MockProduct: Int] {
//        get {
//            if let data = userDefaults.data(forKey: DataManagerKeys.orderProducts.rawValue),
//               let decodedOrderProducts = try? JSONDecoder().decode([MockProduct: Int].self, from: data) {
//                return decodedOrderProducts
//            }
//            return [:]
//        }
//        set {
//            if let encodedData = try? JSONEncoder().encode(newValue) {
//                userDefaults.set(encodedData, forKey: DataManagerKeys.orderProducts.rawValue)
//            }
//        }
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
//    
//    func getTotal() -> Int {
//        var total = 0
//        for product in orderProducts.keys {
//            let quantity = orderProducts[product] ?? 0
//            total += product.price * quantity
//        }
//        return total
//    }
//    
//    func getProducts(byCategory category: MockProductCategory) -> [MockProduct: Int] {
//        let filteredProducts = orderProducts.filter { $0.key.category == category }
//        return filteredProducts
//    }
//    
//    func getOrders(byStatus status: MockOrderStatus) -> [MockOrder] {
//        switch status {
//        case .all:
//            return orderList
//        default:
//            return orderList.filter { $0.status == status }
//        }
//    }
//    
//    func addProductAndUpdateTotal(product: MockProduct, quantity: Int = 1) -> Int {
//        addProduct(product: product, quantity: quantity)
//        let totalPrice = calculateTotalPrice()
//        print("Total price after adding \(quantity) \(product.name): \(totalPrice)")
//        return totalPrice
//    }
//}

//import Foundation
//
//enum DataManagerKeys: String {
//    case refreshToken
//    case accessToken
//    case orderProducts
//}
//
//class DataManager {
//    static let shared = DataManager()
//    private let userDefaults = UserDefaults.standard
//    
//    // Properties from MockData
//    private var tables: [MockTable]
//    private var product: MockProduct
//    private var order: MockOrder
//    private var ordersAll: [MockOrder]
//    private var orderProducts: [MockProduct]
//    private var menuProducts: [MockProduct]
//    private var orderStatuses: [MockOrderStatus]
//    private var categories: [MockProductCategory]
//        
//    private init() {
//        // Initialize properties from MockData
//        tables = MockData.shared.tables
//        product = MockData.shared.product
//        order = MockData.shared.order
//        ordersAll = MockData.shared.ordersAll
//        orderProducts = MockData.shared.orderProducts
//        menuProducts = MockData.shared.menuProducts
//        orderStatuses = MockData.shared.orderStatuses
//        categories = MockData.shared.categories
//    }
//    
//    var tokens: TokenModel {
//        get {
//            let refreshToken = userDefaults.string(forKey: DataManagerKeys.refreshToken.rawValue) ?? ""
//            let accessToken = userDefaults.string(forKey: DataManagerKeys.accessToken.rawValue) ?? ""
//            return TokenModel(refreshToken: refreshToken, accessToken: accessToken)
//        }
//        set {
//            userDefaults.set(newValue.refreshToken, forKey: DataManagerKeys.refreshToken.rawValue)
//            userDefaults.set(newValue.accessToken, forKey: DataManagerKeys.accessToken.rawValue)
//        }
//    }
//    
//    // Method to set tokens
//    func setTokens(token: TokenModel) {
//        self.tokens = token
//    }
//    
//    // Method to add product to order
//    func addProduct(product: MockProduct, quantity: Int = 1) {
//        if let existingQuantity = orderProducts[product] {
//            orderProducts[product] = existingQuantity + quantity
//        } else {
//            orderProducts[product] = quantity
//        }
//    }
//    
//    // Method to deduct product from order
//    func deductProduct(product: MockProduct, quantity: Int = 1) {
//        if let existingQuantity = orderProducts[product] {
//            let newQuantity = max(existingQuantity - quantity, 0)
//            orderProducts[product] = newQuantity
//        }
//    }
//    
//    // Method to remove product from order
//    func removeProductFromOrder(product: MockProduct) -> MockOrder {
//        orderProducts.removeValue(forKey: product)
//        // Assume implementation to retrieve the current order or create a new one if none exists
//        return order
//    }
//    
//    // Method to get quantity of product in order
//    func getQuantity(of product: MockProduct) -> Int {
//        return orderProducts[product] ?? 0
//    }
//    
//    // Method to get all products
//    func getAllProducts() -> [MockProduct] {
//        return menuProducts
//    }
//    
//    // Method to calculate total price of order
//    func calculateTotalPriceOfOrder() -> Int {
//        var totalPrice = 0
//        for (product, quantity) in orderProducts {
//            totalPrice += product.price * quantity
//        }
//        return totalPrice
//    }
//    
//    // Method to calculate subtotal price of product
//    func calculateSubtotalPriceOfProduct(product: MockProduct, quantity: Int) -> Int {
//        return product.price * quantity
//    }
//    
//    // Method to get products filtered by category
//    func getProductsFiltered(by category: MockProductCategory) -> [MockProduct] {
//        return menuProducts.filter { $0.category == category }
//    }
//    
//    // Method to get orders filtered by status
//    func getOrdersFiltered(by status: MockOrderStatus) -> [MockOrder] {
//        return ordersAll.filter { $0.status == status }
//    }
//}

import Foundation

//class DataManager {
//
//  static let shared = DataManager()
//
//  private var tokens: TokenModel?
//  private var orderProducts: [MockProduct: Int] = [:]
//  private var orders: [MockOrder] = []
//
//  private let categories: [MockProductCategory] = [
//    .coffee, .dessert, .bakery, .drinks
//  ]
//
//  private let orderStatuses: [MockOrderStatus] = [
//    .all, .new, .inProgress, .ready, .cancelled, .finished
//  ]
//
//  private init() {
//    // Generate mock products based on MockData.menuProducts
//    var menuProducts: [MockProduct] = []
//    for productData in MockData.shared.menuProducts {
//      menuProducts.append(productData)
//    }
//    
//    // Generate mock orders based on MockData.ordersAll
//    for orderData in MockData.shared.ordersAll {
//      var orderProducts: [MockProduct: Int] = [:]
//      for (product, quantity) in orderData.products {
//        orderProducts[product] = quantity
//      }
//      orders.append(MockOrder(id: orderData.id,
//                              date: orderData.date,
//                              time: orderData.time,
//                              branch: orderData.branch,
//                              status: orderData.status,
//                              table: orderData.table,
//                              waiter: orderData.waiter,
//                              products: orderProducts))
//    }
//  }
//
//  func setTokens(token: TokenModel) {
//    self.tokens = token
//  }
//
//  func addProduct(product: MockProduct, quantity: Int = 1) {
//    orderProducts[product] = (orderProducts[product] ?? 0) + quantity
//  }
//
//  func deductProduct(product: MockProduct, quantity: Int = 1) {
//    if var currentQuantity = orderProducts[product] {
//      currentQuantity -= quantity
//      if currentQuantity > 0 {
//        orderProducts[product] = currentQuantity
//      } else {
//        orderProducts.removeValue(forKey: product)
//      }
//    }
//  }
//
//  func removeProductFromOrder(product: MockProduct) -> MockOrder {
//    defer { orderProducts.removeValue(forKey: product) }
//    guard let currentOrderProducts = orderProducts[product],
//          let order = createOrder(products: [product: currentOrderProducts]) else {
//      return MockOrder(id: 0, date: "", time: "", status: .new, table: nil, waiter: "", products: [:])
//    }
//    return order
//  }
//
//  func getQuantity(of product: MockProduct) -> Int {
//    return orderProducts[product] ?? 0
//  }
//
//  func getAllProducts() -> [MockProduct] {
//    return MockData.shared.menuProducts
//  }
//
//  func calculateTotalPriceOfOrder() -> Int {
//    var totalPrice = 0
//    for (product, quantity) in orderProducts {
//      totalPrice += product.price * quantity
//    }
//    return totalPrice
//  }
//
//  func calculateSubtotalPriceOfProduct(product: MockProduct, quantity: Int) -> Int {
//    return product.price * quantity
//  }
//
//  func getProductsFiltered(by category: MockProductCategory) -> [MockProduct] {
//    return MockData.shared.menuProducts.filter { $0.category == category }
//  }
//
//  func getOrdersFiltered(by status: MockOrderStatus) -> [MockOrder] {
//    return orders.filter { $0.status == status }
//  }
//
//  private func createOrder(products: [MockProduct: Int]) -> MockOrder? {
//    guard !products.isEmpty else { return nil }
//    let table = MockData.shared.tables.first
//    return MockOrder(id: 0, date: "", time: "", status: .new, table: table, waiter: "", products: products)
//  }
//}

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
    
    
//    func searchProduct(by name: String) -> MockProduct? {
//        // Iterate through the menu products to find the one with the matching name
//        for product in mockData.menuProducts {
////            if product.name.lowercased() == name.lowercased() {
////                // Return the product if the names match
////                return product
////            }
//            if product.name == name {
//                return product
//            }
//        }
//        // Return nil if no matching product is found
//        print("No matching product is found in menu")
//        return nil
//    }


        
//    func searchProduct(by name: String) -> MockProduct? {
//        // Convert the search text to lowercase for case-insensitive search
//        let searchTextLowercased = name.lowercased()
//        
//        // Find the first product with the matching lowercase name
//        return mockData.menuProducts.first { $0.name.lowercased() == searchTextLowercased }
//    }
    
//    func searchProduct(by name: String, completion: @escaping (Result<MockProduct, Error>) -> Void) {
//        // Convert the search text to lowercase for case-insensitive search
//        let searchTextLowercased = name.lowercased()
//        
//        // Find the first product with the matching lowercase name
//        if let product = mockData.menuProducts.first(where: { $0.name.lowercased() == searchTextLowercased }) {
//            // Product found locally, return success with the product
//            completion(.success(product))
//        } else {
//            // Product not found locally, return failure
//            let error = NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Product not found"])
//            completion(.failure(error))
//        }
//    }
    


}
