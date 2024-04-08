//
//  CoffeeSupplementsDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 05/04/24.
//

import Foundation

protocol CoffeeSupplementsDrawerViewModelProtocol {
    var popScreen: EmptyCompletion? { get set }
}

final class CoffeeSupplementsDrawerViewModel: CoffeeSupplementsDrawerViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var popScreen: EmptyCompletion?
}
