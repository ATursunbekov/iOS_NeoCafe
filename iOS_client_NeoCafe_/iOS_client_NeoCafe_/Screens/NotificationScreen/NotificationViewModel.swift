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
    var delegate: NotificationViewModelDelegate? { get set }
    var notifications: [NotificationModel] { get set }
    var popScreen: EmptyCompletion? { get set }
    var notificationAmount: Int { get set }
}

class NotificationViewModel: NotificationViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var delegate: NotificationViewModelDelegate?
    var popScreen: EmptyCompletion?
    var notifications: [NotificationModel] = []
    var notificationAmount = 1

    func getBranchNames() {
        networkService.sendRequest(successModelType: [NotificationModel].self, endpoint: MultiTarget(GeneralAPI.getNotifications)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                notifications = response
                DispatchQueue.main.async {
                    self.delegate?.updateData()
                }
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
}
