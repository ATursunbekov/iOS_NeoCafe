//
//  ProfileViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func updateData(fetchedData: ProfileModel)
    func reloadTableView()
}

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? { get set }
    func getProfileData()

    var activeOrders: [OrderModel] { get set }
    var doneOrders: [OrderModel] { get set }
    var logOut: EmptyCompletion? { get set }
    func getOrderHistory()
}

class ProfileViewModel: ProfileViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var delegate: ProfileViewModelDelegate?
    var logOut: EmptyCompletion?

    func getProfileData() {
        networkService.sendRequest(successModelType: ProfileModel.self, endpoint: MultiTarget(GeneralAPI.getProfileData)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.delegate?.updateData(fetchedData: response)
                }
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }

    var activeOrders: [OrderModel] = []
    var doneOrders: [OrderModel] = []

    func getOrderHistory() {
        networkService.sendRequest(successModelType: OrderHistoryModel.self,
                                   endpoint: MultiTarget(GeneralAPI.getOrderHistory))
        { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                activeOrders = response.active
                doneOrders = response.done
                delegate?.reloadTableView()
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
}
