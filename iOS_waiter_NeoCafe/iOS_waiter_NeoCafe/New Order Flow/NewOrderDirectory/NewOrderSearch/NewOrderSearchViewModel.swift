//
//  NewOrderSearchViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 10/04/24.
//

import Foundation

protocol NewOrderSearchViewModelProtocol {
    var popScreen: EmptyCompletion? { get set }
    var foundProducts: [MockProduct] { get set }
    
    func searchProduct(by name: String)
    func getProductsCount() -> Int
}

class NewOrderSearchViewModel: NewOrderSearchViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    var popScreen: EmptyCompletion?
    
    var foundProducts: [MockProduct] = []
    
    func searchProduct(by name: String) {
        // TODO:
    }
    
    func getProductsCount() -> Int {
        foundProducts.count
    }
}
