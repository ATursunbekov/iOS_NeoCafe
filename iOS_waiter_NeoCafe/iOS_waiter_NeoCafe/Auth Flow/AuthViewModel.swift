//
//  AuthViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

import Foundation

typealias EmptyCompletion = (()->Void)

protocol AuthDelegate: AnyObject {
    func loginResponse()
    func successfulConfirmation()
    func confirmationError()
    func loginError()
}

protocol AuthViewModelProtocol {
    var isOnLoginView: Bool {get set}
    var delegate: AuthDelegate? {get set}
    var onOrdersNavigate: EmptyCompletion? {get set}

    func toggleState()
    
    func login(identifier: String, password: String)
    func confirmationCode(email: String, code: String)
}

class AuthViewModel: AuthViewModelProtocol {
    
    @InjectionInjected(\.networkService) var networkService
    
    var onOrdersNavigate: EmptyCompletion?
    weak var delegate: AuthDelegate?
    var isOnLoginView = true
    
    func toggleState() {
        isOnLoginView.toggle()
    }
    
    func login(identifier: String, password: String) {
        networkService.sendRequest(successModelType: String.self, endpoint: MultiTarget(AuthAPI.login(identifier: identifier, password: password))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.loginResponse()
                }
                print(response)
            case .failure(let error):
                print("handle error: \(error)")
                delegate?.loginError()
            }
        }
    }
    
    func confirmationCode(email: String, code: String) {
        networkService.sendRequest(successModelType: TokenModel.self, endpoint: MultiTarget(AuthAPI.confirm(email: email, code: code))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.successfulConfirmation()
                    self.onOrdersNavigate?()
                }
                DataManager.shared.setTokens(token: response)
            case .failure(let error):
                print("handle error: \(error)")
                delegate?.confirmationError()
            }
        }
    }
}
