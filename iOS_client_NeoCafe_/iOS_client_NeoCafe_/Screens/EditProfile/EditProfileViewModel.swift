//
//  EditProfileViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/3/24.
//

import Foundation

protocol EditProfileDelegate: AnyObject {
    func savingData()
}

protocol EditProfileProtocol {}

class EditProfileViewModel: EditProfileProtocol {
    @InjectionInjected(\.networkService) var networkService
    var delegate: EditProfileDelegate?
    
    func updateData(newEmail: String) {
        networkService.sendRequest(successModelType: ProfileModel.self, endpoint: MultiTarget(GeneralAPI.getProfileData)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.savingData()
                }
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
