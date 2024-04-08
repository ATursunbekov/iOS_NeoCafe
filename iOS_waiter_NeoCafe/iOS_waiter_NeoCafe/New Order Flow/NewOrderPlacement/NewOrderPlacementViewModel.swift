//
//  NewOrderPlacementViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderPlacementViewModelProtocol {
    var onNewOrderNavigate: EmptyCompletion? { get set }
}

final class NewOrderPlacementViewModel: NewOrderPlacementViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var onNewOrderNavigate: EmptyCompletion?
}
