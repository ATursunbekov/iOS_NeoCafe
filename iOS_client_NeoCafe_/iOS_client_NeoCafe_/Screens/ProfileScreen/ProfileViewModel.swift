//
//  ProfileViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func updateData(fetchedData: ProfileModel)
}

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? {get set}
    func getProfileData()
}

class ProfileViewModel: ProfileViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var delegate: ProfileViewModelDelegate?
    
    func getProfileData() {
        networkService.sendRequest(successModelType: ProfileModel.self, endpoint: MultiTarget(GeneralAPI.getProfileData)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.updateData(fetchedData: response)
                }
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }

}
