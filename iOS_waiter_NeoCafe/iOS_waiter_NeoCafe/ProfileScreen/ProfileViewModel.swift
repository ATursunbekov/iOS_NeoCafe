//
//  ProfileViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 4/4/24.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func reloadData(profileData: ProfileModel)
}

protocol ProfileViewModelProtocol {
    var popBack: EmptyCompletion? {get set}
    var profileModel: ProfileModel? {get set}
    var delegate: ProfileViewModelDelegate? {get set}
    var logout: EmptyCompletion? {get set}
    var goBack: EmptyCompletion? {get set}
}

class ProfileViewModel: ProfileViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var popBack: EmptyCompletion?
    var profileModel: ProfileModel?
    var delegate: ProfileViewModelDelegate?
    var logout: EmptyCompletion?
    var goBack: EmptyCompletion?
    
    func getProfileData() {
        networkService.sendRequest(successModelType: ProfileModel.self, endpoint: MultiTarget(ProfileAPI.getProfile)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                profileModel = response
                DispatchQueue.main.async {
                    self.delegate?.reloadData(profileData: response)
                }
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }

}
