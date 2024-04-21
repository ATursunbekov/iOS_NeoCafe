//
//  MenuSearchViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 10/04/24.
//

import Foundation

protocol MenuSearchViewModelDelegate: AnyObject {
    func reloadData()
}

protocol MenuSearchViewModelProtocol {
    var popScreen: EmptyCompletion? { get set }
    
    var foundProducts: [MockProduct] { get set }
    var allProducts: [MockProduct] { get set }
    var searchText: String { get set }
    
    var delegate: MenuSearchViewModelDelegate? { get set }
    
    func searchProduct(by name: String) -> MockProduct?
    func getProductsCount() -> Int
}

class MenuSearchViewModel: MenuSearchViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    weak var delegate: MenuSearchViewModelDelegate?
    var popScreen: EmptyCompletion?
    
    var searchText: String = ""
    var foundProducts: [MockProduct] = []
    var allProducts: [MockProduct] = DataManager.shared.getAllProducts()
    
    func searchProduct(by name: String) {
        if let foundProduct = DataManager.shared.searchProduct(by: name) {
            print("Found product: \(foundProduct)")
            foundProducts = [foundProduct]
            delegate?.reloadData()
        } else {
            print("Product not found")
        }
    }
        
    func getProductsCount() -> Int {
        foundProducts.count
    }
    
    func searchProduct(by name: String) -> MockProduct? {
        if let localProduct = findLocalProduct(by: name.lowercased()) {
            foundProducts = [localProduct]
            delegate?.reloadData()
            return localProduct
        } else {
            if let remoteProduct = DataManager.shared.searchProduct(by: name) {
                foundProducts = [remoteProduct]
                delegate?.reloadData()
                return remoteProduct
            } else {
                print("Product not found")
                return nil
            }
        }
    }
    
    private func findLocalProduct(by name: String) -> MockProduct? {
        return allProducts.first { $0.name.lowercased() == name.lowercased() }
    }
}



