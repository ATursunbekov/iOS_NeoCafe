//
//  CoffeeSupplementsDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 05/04/24.
//

import Foundation

protocol CoffeeSupplementsDrawerViewModelProtocol {
    var dismissModule: EmptyCompletion? { get set }
}

final class CoffeeSupplementsDrawerViewModel: CoffeeSupplementsDrawerViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    var dismissModule: EmptyCompletion?
}
