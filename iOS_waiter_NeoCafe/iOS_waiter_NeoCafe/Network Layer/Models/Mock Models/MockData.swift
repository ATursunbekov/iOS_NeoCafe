//
//  MockData.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 03/04/24.
//

import UIKit

class MockData {
    static let shared = MockData()

    var product: MockProduct
    var categories: [MockProductCategory]
    var orderStatuses: [MockOrderStatus]
    var tables: [MockTable]
    var menuProducts: [MockProduct]
    var orderProducts: [MockProduct: Int]
    var ordersAll: [MockOrder]
    var order: MockOrder

    private init() {
        
        product = MockProduct(id: 1,
                              category: .coffee,
                              name: "Латте",
                              description: nil,
                              quantity: 1,
                              price: 100,
                              image: nil,
                              supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
                              composition: nil)
        
        categories = [
            MockProductCategory.coffee,
            MockProductCategory.dessert,
            MockProductCategory.bakery,
            MockProductCategory.drinks,
        ]
        
        // Generate mock statuses
        orderStatuses = [
            MockOrderStatus.all,
            MockOrderStatus.new,
            MockOrderStatus.inProgress,
            MockOrderStatus.ready,
            MockOrderStatus.cancelled,
            MockOrderStatus.finished,
        ]
        
        // Generate mock tables
        tables = [
            MockTable(id: 1, number: 1, status: .vacant),
            MockTable(id: 2, number: 2, status: .reserved),
            MockTable(id: 3, number: 3, status: .vacant),
            MockTable(id: 4, number: 4, status: .reserved),
            MockTable(id: 5, number: 5, status: .vacant),
            MockTable(id: 6, number: 6, status: .reserved),
            MockTable(id: 7, number: 7, status: .vacant),
            MockTable(id: 8, number: 8, status: .reserved),
            MockTable(id: 9, number: 9, status: .vacant),
            MockTable(id: 10, number: 10, status: .reserved),
            MockTable(id: 11, number: 11, status: .vacant),
            MockTable(id: 12, number: 12, status: .reserved),
            MockTable(id: 13, number: 13, status: .vacant),
            MockTable(id: 14, number: 14, status: .reserved),
            MockTable(id: 15, number: 15, status: .vacant),
        ]
        
        // Generate mock menu products
        menuProducts = [
            MockProduct(id: 1,
                        category: .coffee,
                        name: "Латте",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
                        composition: nil),
            MockProduct(id: 2,
                        category: .bakery,
                        name: "Круассан",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 3,
                        category: .dessert,
                        name: "Чизкейк",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 4,
                        category: .drinks,
                        name: "Пина Коллада",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 5,
                        category: .coffee,
                        name: "Раф",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Соевое молоко", syrup: "Карамельный"),
                        composition: nil),
            MockProduct(id: 6,
                        category: .bakery,
                        name: "Растегай",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 7,
                        category: .dessert,
                        name: "Тирамису",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 8,
                        category: .drinks,
                        name: "Радуга",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 9,
                        category: .coffee,
                        name: "Капучино",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Соевое молоко", syrup: "Карамельный"),
                        composition: nil),
            MockProduct(id: 10,
                        category: .coffee,
                        name: "Американо",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Соевое молоко", syrup: "Карамельный"),
                        composition: nil),
            MockProduct(id: 11,
                        category: .coffee,
                        name: "Эспрессо",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Соевое молоко", syrup: "Карамельный"),
                        composition: nil),
            MockProduct(id: 12,
                        category: .coffee,
                        name: "Мокко",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Соевое молоко", syrup: "Карамельный"),
                        composition: nil),
            MockProduct(id: 13,
                        category: .drinks,
                        name: "Багровый закат",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 14,
                        category: .drinks,
                        name: "Мохито",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 15,
                        category: .drinks,
                        name: "Багровый закат",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 16,
                        category: .bakery,
                        name: "Булочка с коррицей",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 17,
                        category: .bakery,
                        name: "Шарлотка",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 18,
                        category: .bakery,
                        name: "Сырные крекеры",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 19,
                        category: .dessert,
                        name: "Брауни",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
            MockProduct(id: 20,
                        category: .dessert,
                        name: "Маффин",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: nil,
                        composition: nil),
        ]
                
        // Generate mock order products (Dictionary)
        orderProducts = [
            MockProduct(id: 1,
                        category: .coffee,
                        name: "Латте",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
                        composition: nil): 1,
            MockProduct(id: 2,
                        category: .bakery,
                        name: "Круассан",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Не применимо", syrup: "Не применимо"),
                        composition: nil): 1,
            MockProduct(id: 3,
                        category: .coffee,
                        name: "Капучино",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
                        composition: nil): 1,
            MockProduct(id: 4,
                        category: .bakery,
                        name: "Шарлотка",
                        description: nil,
                        quantity: 1,
                        price: 100,
                        image: nil,
                        supplements: MockCoffeeSupplement(milk: "Не применимо", syrup: "Не применимо"),
                        composition: nil): 1
        ]

    
        // Create mock orders
        ordersAll = [
            MockOrder(id: 12345,
                      date: "2024-04-03",
                      time: "14:30",
                      branch: nil,
                      status: .new,
                      table: tables[0],
                      waiter: "Игорь",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .inProgress,
                      table: tables[2],
                      waiter: "Алихан",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .ready,
                      table: tables[3],
                      waiter: "Венера",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .cancelled,
                      table: tables[4],
                      waiter: "Роман",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .finished,
                      table: tables[5],
                      waiter: "Хаади",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .inProgress,
                      table: tables[6],
                      waiter: "Азамат",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .ready,
                      table: tables[3],
                      waiter: "Венера",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .finished,
                      table: tables[5],
                      waiter: "Хаади",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .ready,
                      table: tables[3],
                      waiter: "Венера",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .finished,
                      table: tables[5],
                      waiter: "Хаади",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .finished,
                      table: tables[5],
                      waiter: "Хаади",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .finished,
                      table: tables[5],
                      waiter: "Хаади",
                      products: orderProducts),
            MockOrder(id: 12345,
                      date: "2024-04-04",
                      time: "15:00",
                      branch: nil,
                      status: .finished,
                      table: tables[5],
                      waiter: "Хаади",
                      products: orderProducts),
        ]
        
        // Create a mock order
        order = MockOrder(
            id: 12345,
            date: "2024-04-03",
            time: "14:30",
            branch: nil,
            status: .new,
            table: tables[0],
            waiter: "Игорь",
            products: orderProducts
        )
    }
}

// Generate mock order products (Dictionary)
//var orderProducts: [MockProduct: Int] = [
//    MockProduct(id: 12345,
//                category: .coffee,
//                name: "Латте",
//                description: nil,
//                quantity: 1,
//                price: 100,
//                image: nil,
//                supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
//                composition: nil): 1,
//    MockProduct(id: 12345,
//                category: .bakery,
//                name: "Круассан",
//                description: nil,
//                quantity: 1,
//                price: 100,
//                image: nil,
//                supplements: MockCoffeeSupplement(milk: "Не применимо", syrup: "Не применимо"),
//                composition: nil): 1,
//    MockProduct(id: 12345,
//                category: .coffee,
//                name: "Капучино",
//                description: nil,
//                quantity: 1,
//                price: 100,
//                image: nil,
//                supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
//                composition: nil): 1,
//    MockProduct(id: 12345,
//                category: .bakery,
//                name: "Шарлотка",
//                description: nil,
//                quantity: 1,
//                price: 100,
//                image: nil,
//                supplements: MockCoffeeSupplement(milk: "Не применимо", syrup: "Не применимо"),
//                composition: nil): 1
//]


// Generate mock order products (Array)
//        orderProducts = [
//            MockProduct(id: 12345,
//                        category: .coffee,
//                        name: "Латте",
//                        description: nil,
//                        quantity: 1,
//                        price: 100,
//                        image: nil,
//                        supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
//                        composition: nil),
//            MockProduct(id: 12345,
//                        category: .bakery,
//                        name: "Круассан",
//                        description: nil,
//                        quantity: 1,
//                        price: 100,
//                        image: nil,
//                        supplements: MockCoffeeSupplement(milk: "Не применимо", syrup: "Не применимо"),
//                        composition: nil),
//            MockProduct(id: 12345,
//                        category: .coffee,
//                        name: "Капучино",
//                        description: nil,
//                        quantity: 1,
//                        price: 100,
//                        image: nil,
//                        supplements: MockCoffeeSupplement(milk: "Миндальное молоко", syrup: "Клубничный"),
//                        composition: nil),
//            MockProduct(id: 12345,
//                        category: .bakery,
//                        name: "Шарлотка",
//                        description: nil,
//                        quantity: 1,
//                        price: 100,
//                        image: nil,
//                        supplements: MockCoffeeSupplement(milk: "Не применимо", syrup: "Не применимо"),
//                        composition: nil),
//        ]


/////////////////////////////////////////////////////////////////////////////////////////////////////////////

//struct MockOrder: Codable {
//    let id: Int
//    let date: String
//    let time: String
//    let branch: String?
//    let status: MockOrderStatus
//    let table: MockTable
//    let waiter: String
//    let products: [MockProduct]
//    
//    var totalPrice: Int {
//        var total: Int = 0
//        for product in products {
//            total += (product.price * product.quantity)
//        }
//        return total
//    }
//}

//struct MockOrder: Codable, Hashable {
//    let id: Int
//    let date: String
//    let time: String
//    let branch: String?
//    let status: MockOrderStatus
//    let table: MockTable
//    let waiter: String
//    let products: [MockProduct]
//    
//    var totalPrice: Int {
//        var total: Int = 0
//        for product in products {
//            total += (product.price * product.quantity)
//        }
//        return total
//    }
//
//    // Implementing hash(into:) method to conform to Hashable
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//        hasher.combine(date)
//        hasher.combine(time)
//        hasher.combine(branch)
//        hasher.combine(status)
//        hasher.combine(table)
//        hasher.combine(waiter)
//        hasher.combine(products)
//    }
//}

struct MockOrder: Codable, Hashable {
    let id: Int
    let date: String
    let time: String
    let branch: String?
    let status: MockOrderStatus
    let table: MockTable
    let waiter: String
    var products: [MockProduct: Int]
    
    var totalPrice: Int {
        var total: Int = 0
        for (product, quantity) in products {
            total += (product.price * quantity)
        }
        return total
    }

    // Implementing hash(into:) method to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(date)
        hasher.combine(time)
        hasher.combine(branch)
        hasher.combine(status)
        hasher.combine(table)
        hasher.combine(waiter)
        hasher.combine(products)
    }
}

//struct MockTable: Codable {
//    let id: Int
//    let number: Int
//    let status: MockTableStatus
//    
//    enum MockTableStatus: Codable {
//        case vacant
//        case reserved
//        
//        var isVacant: Bool {
//            switch self {
//            case .vacant:
//                return true
//            case .reserved:
//                return false
//            }
//        }
//    }
//}
struct MockTable: Codable, Hashable {
    let id: Int
    let number: Int
    let status: MockTableStatus
    
    // Conforming MockTableStatus to Hashable
    enum MockTableStatus: String, Codable, Hashable {
        case vacant
        case reserved
        
        var isVacant: Bool {
            switch self {
            case .vacant:
                return true
            case .reserved:
                return false
            }
        }
    }
    
    // Implementing hash(into:) method to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(number)
        hasher.combine(status)
    }
}

struct MockProduct: Hashable, Codable {
    let id: Int
    let category: MockProductCategory
    let name: String
    let description: String?
    let quantity: Int
    let price: Int
    let image: String?
    let supplements: MockCoffeeSupplement?
    let composition: [MockComposition]?
    
    var subtotalPrice: Int {
        return quantity * price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MockProduct, rhs: MockProduct) -> Bool {
        return lhs.id == rhs.id
    }
}

struct MockCoffeeSupplement: Codable {
    let milk: String?
    let syrup: String?
}

struct MockComposition: Codable {
    let name: String?
    let quantity: String?
    let measure: String?
}

enum MockOrderStatus: String, CaseIterable, Codable {
    case all = "Все"
    case new = "Новые"
    case inProgress = "В процессе"
    case ready = "Готово"
    case cancelled = "Отменено"
    case finished = "Завершено"
    
    static var allStatuses: [String] {
        var statuses = ["Все"]
        statuses.append(contentsOf: MockOrderStatus.allCases.map { $0.rawValue })
        return statuses
    }
    
    var index: Int {
        switch self {
        case .all: return 0
        case .new: return 1
        case .inProgress: return 2
        case .ready: return 3
        case .cancelled: return 4
        case .finished: return 5
        }
    }
    
    var color: UIColor? {
        switch self {
        case .all: return nil
        case .new: return .colorSkyBlue
        case .inProgress: return .colorYellow
        case .ready: return .colorGreen
        case .cancelled: return .colorDarkBlue
        case .finished: return .colorGray
        }
    }
}

enum MockProductCategory: String, CaseIterable, Codable {
    case coffee = "Кофе"
    case dessert = "Десерт"
    case bakery = "Выпечка"
    case drinks = "Напитки"
    
    // TODO: allCategories
    static var allCategories: [String] {
        var categories: [String] = []
        categories.append(contentsOf: MockProductCategory.allCases.map { $0.rawValue })
        return categories
    }

    var index: Int {
        switch self {
        case .coffee: return 0
        case .dessert: return 1
        case .bakery: return 2
        case .drinks: return 3
        }
    }

    var image: String {
        switch self {
        case .coffee: return "coffeeCategory"
        case .dessert: return "dessertCategory"
        case .bakery: return "bakeryCategory"
        case .drinks: return "drinksCategory"
        }
    }
}

