//
//  MockCategory.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Foundation

struct MockCategory {
    let name: String
    let image: String
}

class AppMockCategory {
    static let shared = AppMockCategory()
    var mockCategories: [MockCategory]

    private init() {
        mockCategories = [
            MockCategory(name: "Кофе", image: "coffeeCategory"),
            MockCategory(name: "Десерты", image: "dessertCategory"),
            MockCategory(name: "Выпечка", image: "bakeryCategory"),
            MockCategory(name: "Напитки", image: "drinksCategory"),
        ]
    }
}

