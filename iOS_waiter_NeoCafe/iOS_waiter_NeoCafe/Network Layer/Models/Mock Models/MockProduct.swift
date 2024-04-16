//
//  ProductModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 01/04/24.
//

import Foundation

enum Category: Int {
    case coffee = 0
    case dessert = 1
    case bakery = 2
    case drinks = 3
}

struct CoffeeSupplement {
    let milk: String?
    let syrup: String?
}

struct MockProduct {
    var category: Category
    let name: String
    let quantity: Int
    let price: Int
    let coffeeSupplement: CoffeeSupplement?
    
    var subtotalPrice: Int {
        return quantity * price
    }
}

class AppMockProducts {
    static let shared = AppMockProducts()
    var mockCoffeeProducts: [MockProduct]
    var mockDessertProducts: [MockProduct]
    var mockBakeryProducts: [MockProduct]
    var mockDrinksProducts: [MockProduct]
    
    private init() {
        mockCoffeeProducts = [
            MockProduct(category: .coffee, 
                        name: "Латте",
                        quantity: 1,
                        price: 10,
                        coffeeSupplement: CoffeeSupplement(
                            milk: "Коровье молоко",
                            syrup: "Карамельный сироп")),
            MockProduct(category: .coffee,
                        name: "Американо",
                        quantity: 1,
                        price: 10,
                        coffeeSupplement: CoffeeSupplement(
                            milk: "Коровье молоко",
                            syrup: "Карамельный сироп")),
            MockProduct(category: .coffee,
                        name: "Раф",
                        quantity: 1,
                        price: 10,
                        coffeeSupplement: CoffeeSupplement(
                            milk: "Коровье молоко",
                            syrup: "Карамельный сироп")),
        ]
        mockDessertProducts = [
            MockProduct(category: .dessert, name: "Круассан", quantity: 1, price: 10, coffeeSupplement: nil),
            MockProduct(category: .dessert, name: "Творожник", quantity: 1, price: 10, coffeeSupplement: nil),
            MockProduct(category: .dessert, name: "Наполеон", quantity: 1, price: 10, coffeeSupplement: nil),
        ]
        mockBakeryProducts = [
            MockProduct(category: .bakery, name: "Пирожок", quantity: 1, price: 10, coffeeSupplement: nil),
            MockProduct(category: .bakery, name: "Ватрушка", quantity: 1, price: 10, coffeeSupplement: nil),
            MockProduct(category: .bakery, name: "Блинчики", quantity: 1, price: 10, coffeeSupplement: nil),
        ]
        mockDrinksProducts = [
            MockProduct(category: .drinks, name: "Кровавая Мерри", quantity: 1, price: 10, coffeeSupplement: nil),
            MockProduct(category: .drinks, name: "Пина Коллада", quantity: 1, price: 10, coffeeSupplement: nil),
            MockProduct(category: .drinks, name: "Радуга", quantity: 1, price: 10, coffeeSupplement: nil),
        ]
    }
}
