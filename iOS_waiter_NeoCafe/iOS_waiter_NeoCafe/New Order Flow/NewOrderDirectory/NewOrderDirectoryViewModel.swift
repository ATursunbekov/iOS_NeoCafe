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
    var onNewOrderInfoDrawerNavigate: ((MockOrder)->Void)? { get set }
    
    // Indexes
    var categorySelectedIndex: Int { get set }
    var productSelectedIndex: Int { get set }
    
    // Data
    var categories: [MockProductCategory] { get set }
    var filteredProducts: [MockProduct] { get set }
    var order: MockOrder { get set }
    var basket: [MockOrder: Int] { get set }
    
    // Methods
    func filterMenu(by category: MockProductCategory)
    func changeSelectedIndex(with index: Int)
    
    func getCategoriesCount() -> Int
    func getProductsCount() -> Int
    
    func getTotal(product: MockProduct, quantity: Int) -> Int
}

class NewOrderDirectoryViewModel: NewOrderDirectoryViewModelProtocol {
    func getTotal(product: MockProduct, quantity: Int) -> Int {
        let result = DataManager.shared.addProductAndUpdateTotal(product: product, quantity: 1)
        return result
    }
    
    @InjectionInjected(\.networkService) var networkService

    // Navigation
    var onBackNavigate: EmptyCompletion?
    var onNewOrderSearchNavigate: EmptyCompletion?
    var onNewOrderInfoDrawerNavigate: ((MockOrder)->Void)?
    
    // Indexes
    var categorySelectedIndex: Int = 0
    var productSelectedIndex: Int = 0
    
    // Data
    var categories: [MockProductCategory] = MockData.shared.categories
    var menuProducts: [MockProduct] = MockData.shared.menuProducts
    var filteredProducts: [MockProduct] = []
    var order: MockOrder = MockData.shared.order
    
    var basket: [MockOrder: Int] = [:]
    
    // Init
    init(selectedIndex: Int = 0) {
        self.categorySelectedIndex = selectedIndex
        filterMenu(by: categories[selectedIndex])
    }
    
    // Methods
//    func filterMenu(by category: MockProductCategory) {
//        filteredProducts = (category.rawValue == MockProductCategory.allCategories[0]) ? menuProducts : menuProducts.filter { $0.category == category }
//    }
    
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

