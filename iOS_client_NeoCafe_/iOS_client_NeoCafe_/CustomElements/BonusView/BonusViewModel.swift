//
//  BonusViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 1/4/24.
//

import Foundation

protocol BonusViewModelDelegate: AnyObject {
    func updateData()
}

protocol BonusViewModelProtocol {
    var bonusAmount: Int { get set }
    var delegate: BonusViewModelDelegate? { get set }
    func getProfileData()
}

class BonusViewModel: BonusViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var bonusAmount = 0
    var delegate: BonusViewModelDelegate?

    func getProfileData() {
        networkService.sendRequest(successModelType: ProfileModel.self, endpoint: MultiTarget(GeneralAPI.getProfileData)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.bonusAmount = Int(response.bonus) ?? 0
                    self.delegate?.updateData()
                }
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
}
