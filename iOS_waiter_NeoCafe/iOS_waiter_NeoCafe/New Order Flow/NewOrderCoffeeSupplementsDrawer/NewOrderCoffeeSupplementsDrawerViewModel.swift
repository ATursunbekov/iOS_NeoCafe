//
//  NewOrderCoffeeSupplementsDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol ProductViewModelDelegate: AnyObject {
    func didCalculateTotalPrice(_ totalPrice: Int)
    func removeItem()
}

protocol NewOrderCoffeeSupplementsDrawerViewModelProtocol {
    var popScreen: EmptyCompletion? { get set }
    var delegate: ProductViewModelDelegate? { get set }
    
    var product: MockProduct { get set }
    var productQuantity: Int { get set }
    var productTotalPrice: Int { get set }
    
    func calculateTotalPrice()
    func updateProductQuantity()
}

final class NewOrderCoffeeSupplementsDrawerViewModel: NewOrderCoffeeSupplementsDrawerViewModelProtocol {
    
    @InjectionInjected(\.networkService) var networkService
    
    var productTotalPrice = 0
    
    func updateProductQuantity() {
        if productQuantity < 9 {
            productQuantity += 1
            delegate?.didCalculateTotalPrice(productQuantity)
        } else if productQuantity < 1 {
            delegate?.removeItem()
        } else {
            productQuantity -= 1
            delegate?.didCalculateTotalPrice(productQuantity)
        }
    }

    var popScreen: EmptyCompletion?

    weak var delegate: ProductViewModelDelegate?
    
    var product = MockData.shared.product
    var productQuantity = 1
    
    func calculateTotalPrice() {
        let totalPrice = product.price * productQuantity
        delegate?.didCalculateTotalPrice(totalPrice)
        productTotalPrice = totalPrice
    }
    
    
}
