//
//  NewOrderDirectoryViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderDirectoryViewModelProtocol {
    // Navigation
    var onBackNavigate: EmptyCompletion? { get set }
    var onNewOrderSearchNavigate: EmptyCompletion? { get set }
    var onNewOrderInfoDrawerNavigate: (([MockProduct])->Void)? { get set }
    
    // Indexes
    var categorySelectedIndex: Int { get set }
    var productSelectedIndex: Int { get set }
    
    // Data
    var categories: [MockProductCategory] { get set }
    var filteredProducts: [MockProduct] { get set }

    var allProducts: [MockProduct] { get set }
    var order: [MockProduct] { get set }
    var orderTotalAmount: Int { get set }

    
    // Methods
    func filterMenu(by category: MockProductCategory)
    func changeSelectedIndex(with index: Int)
    
    func getCategoriesCount() -> Int
    func getProductsCount() -> Int
    
    func getTotal(product: MockProduct, quantity: Int) -> Int
    
    func getOrderTotalAmount() -> Int
    func addProductToOrder(product: MockProduct)
}

class NewOrderDirectoryViewModel: NewOrderDirectoryViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
    var allProducts: [MockProduct] = DataManager.shared.getAllProducts()
    var order: [MockProduct] = []
    var orderTotalAmount: Int = 0
    
    // Navigation
    var onBackNavigate: EmptyCompletion?
    var onNewOrderSearchNavigate: EmptyCompletion?
    var onNewOrderInfoDrawerNavigate: (([MockProduct])->Void)?
    
    // Indexes
    var categorySelectedIndex: Int = 0
    var productSelectedIndex: Int = 0
    
    // Data
    var categories: [MockProductCategory] = MockData.shared.categories
    var menuProducts: [MockProduct] = MockData.shared.menuProducts
    var filteredProducts: [MockProduct] = []
    
    // Init
    init(selectedIndex: Int = 0) {
        self.categorySelectedIndex = selectedIndex
        filterMenu(by: categories[selectedIndex])
    }
}
 
extension NewOrderDirectoryViewModel {
    
    func filterMenu(by category: MockProductCategory) {
        filteredProducts = menuProducts.filter { $0.category == category }
    }
    
    func changeSelectedIndex(with index: Int) {
        categorySelectedIndex = index
        filterMenu(by: categories[index])
    }
}

extension NewOrderDirectoryViewModel {
    
    func getCategoriesCount() -> Int {
        return categories.count
    }
    
    func getProductsCount() -> Int {
        return filteredProducts.count
    }
}

extension NewOrderDirectoryViewModel {
    
    func addProductToOrder(product: MockProduct) {
        order.append(product)
        getOrderTotalAmount()
    }
    
    func getOrderTotalAmount() -> Int {
        var totalAmount = 0
        for product in order {
            totalAmount += product.price
        }
        orderTotalAmount = totalAmount
        return totalAmount
    }
    
    func getTotal(product: MockProduct, quantity: Int) -> Int {
        let totalPrice = DataManager.shared.calculateTotalPriceOfOrder()
        return totalPrice
    }
}
