//
//  NotificationViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import Foundation

protocol NotificationViewModelDelegate: AnyObject {
    func updateData()
}

protocol NotificationViewModelProtocol {
    var delegate: NotificationViewModelDelegate? {get set}
    var notifications: [NotificationModel] {get set}
}

class NotificationViewModel: NotificationViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var delegate: NotificationViewModelDelegate?
    var notifications: [NotificationModel] = []
    
    func getBranchNames() {
        networkService.sendRequest(successModelType: [NotificationModel].self, endpoint: MultiTarget(GeneralAPI.getNotifications)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                notifications = response
                DispatchQueue.main.async {
                    self.delegate?.updateData()
                }
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
