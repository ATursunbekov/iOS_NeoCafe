//
//  AuthenticationViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import Foundation

protocol AuthViewModelProtocol {
    var coordinator: AuthCoordinator? {get set}
    var authState: Int {get set}
}

class AuthViewModel: AuthViewModelProtocol {
    var coordinator: AuthCoordinator?
    var authState = 0
}
