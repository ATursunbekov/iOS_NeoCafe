//
//  MenuViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 10/04/24.
//

import Foundation

protocol MenuViewModelProtocol {
    // Navigation
    var onProfileNavigate: EmptyCompletion? { get set }
    var onNoticeNavigate: EmptyCompletion? { get set }
    var onMenuSearchNavigate: EmptyCompletion? { get set }
    
    // Indexes
    var categorySelectedIndex: Int { get set }
    
    // Data
    var categories: [MockProductCategory] { get set }
    var filteredProducts: [MockProduct] { get set }
    
    // Methods
    func filterMenu(by category: MockProductCategory)
    func getCategoriesCount() -> Int
    func getProductsCount() -> Int
    func changeSelectedIndex(with index: Int)
}

class MenuViewModel: MenuViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    
    // Navigation
    var onProfileNavigate: EmptyCompletion?
    var onNoticeNavigate: EmptyCompletion?
    var onMenuSearchNavigate: EmptyCompletion?
    
    // Indexes
    var categorySelectedIndex: Int = 0
    
    // Data
    var categories: [MockProductCategory] = MockData.shared.categories
    var menuProducts: [MockProduct] = MockData.shared.menuProducts
    var filteredProducts: [MockProduct] = []
    
    // Init
    init(selectedIndex: Int = 0) {
        self.categorySelectedIndex = selectedIndex
        filterMenu(by: categories[selectedIndex])
    }
    
    // Methods
    func filterMenu(by category: MockProductCategory) {
        filteredProducts = DataManager.shared.getProductsFiltered(by: category)
    }
    
    func changeSelectedIndex(with index: Int) {
        categorySelectedIndex = index
        filterMenu(by: categories[index])
    }
}

extension MenuViewModel {
    func getCategoriesCount() -> Int {
        return categories.count
    }
    
    func getProductsCount() -> Int {
        return filteredProducts.count
    }
}

