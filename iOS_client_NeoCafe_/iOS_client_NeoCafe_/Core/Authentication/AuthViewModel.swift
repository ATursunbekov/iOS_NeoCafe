//
//  AuthenticationViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import Foundation

protocol AuthDelegate: AnyObject {
    func signUpResponse()
    func signInResponse()
    func successfulConfirmation()
    func confirmationError()
    func emailError()
}

protocol AuthViewModelProtocol {
    var coordinator: AuthCoordinator? {get set}
    var firstState: Bool {get set}
    var delegate: AuthDelegate? {get set}
    
    func changeState() 
    func signUp(email: String)
    func signIn(email: String)
    func confirmationCode(email: String, code: String)
}

class AuthViewModel: AuthViewModelProtocol {
    
    @InjectionInjected(\.networkService) var networkService
    
    var coordinator: AuthCoordinator?
    var delegate: AuthDelegate?
    var firstState = true
    
    func changeState() {
        firstState.toggle()
    }
    
    func signUp(email: String) {
        networkService.sendRequest(successModelType: String.self, endpoint: MultiTarget(AuthAPI.signUp(email: email))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.signUpResponse()
                }
                print(response)
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
    
    func signIn(email: String) {
        networkService.sendRequest(successModelType: String.self, endpoint: MultiTarget(AuthAPI.signIn(email: email))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.signInResponse()
                }
                print(response)
            case .failure(let error):
                print("handle error: \(error)")
                delegate?.emailError()
            }
        }
    }
    
    func confirmationCode(email: String, code: String) {
        networkService.sendRequest(successModelType: Token.self, endpoint: MultiTarget(AuthAPI.confirm(email: email, code: code))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.successfulConfirmation()
                }
                print(response)
            case .failure(let error):
                print("handle error: \(error)")
                delegate?.confirmationError()
            }
        }
    }
}
