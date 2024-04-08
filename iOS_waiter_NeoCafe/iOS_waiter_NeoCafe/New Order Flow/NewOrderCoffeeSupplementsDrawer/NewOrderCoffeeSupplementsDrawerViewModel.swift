//
//  NewOrderCoffeeSupplementsDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderCoffeeSupplementsDrawerViewModelProtocol {
    var popScreen: EmptyCompletion? { get set }
}

final class NewOrderCoffeeSupplementsDrawerViewModel: NewOrderCoffeeSupplementsDrawerViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var popScreen: EmptyCompletion?
}
