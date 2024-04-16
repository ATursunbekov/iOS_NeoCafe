//
//  AuthViewModel.swift
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
    var firstState: Bool { get set }
    var delegate: AuthDelegate? { get set }
    var onAuthNavigate: EmptyCompletion? { get set }

    func changeState()
    func signUp(email: String)
    func signIn(email: String)
    func confirmationCode(email: String, code: String)
    func timeString(time: TimeInterval) -> String
}

class AuthViewModel: AuthViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    var onAuthNavigate: EmptyCompletion?
    var delegate: AuthDelegate?
    var firstState = true

    func changeState() {
        firstState.toggle()
    }

    func signUp(email: String) {
        networkService.sendRequest(successModelType: String.self, endpoint: MultiTarget(AuthAPI.signUp(email: email))) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.delegate?.signUpResponse()
                }
                print(response)
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }

    func signIn(email: String) {
        networkService.sendRequest(successModelType: String.self, endpoint: MultiTarget(AuthAPI.signIn(email: email))) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.delegate?.signInResponse()
                }
                print(response)
            case let .failure(error):
                print("handle error: \(error)")
                delegate?.emailError()
            }
        }
    }

    func confirmationCode(email: String, code: String) {
        networkService.sendRequest(successModelType: Token.self, endpoint: MultiTarget(AuthAPI.confirm(email: email, code: code))) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.onAuthNavigate?()
                }
                DataManager.shared.setTokens(token: response)
            case let .failure(error):
                print("handle error: \(error)")
                delegate?.confirmationError()
            }
        }
    }

    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
