//
//  SuccessfulClosingModalViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 05/04/24.
//

import Foundation

protocol SuccessfulClosingModalViewModelProtocol {
    var onOrdersNavigate: EmptyCompletion? { get set }
}

final class SuccessfulClosingModalViewModel: SuccessfulClosingModalViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var onOrdersNavigate: EmptyCompletion?
}


