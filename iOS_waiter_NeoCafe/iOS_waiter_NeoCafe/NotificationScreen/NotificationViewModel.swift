//
//  NotificationViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 5/4/24.
//

import Foundation

protocol NotificationViewModelDelegate: AnyObject {
    func updateData()
}

protocol NotificationViewModelProtocol {
    var delegate: NotificationViewModelDelegate? {get set}
    var notifications: [NotificationModel] {get set}
    var popScreen: EmptyCompletion? {get set}
    var notificationAmount: Int {get set}
    var popBack: EmptyCompletion? {get set}
}

class NotificationViewModel: NotificationViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var popBack: EmptyCompletion?
    var delegate: NotificationViewModelDelegate?
    var popScreen: EmptyCompletion?
    var notifications: [NotificationModel] = []
    var notificationAmount = 1
    
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
