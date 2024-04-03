//
//  OrderHistoryViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/3/24.
//

import Foundation

protocol OrderHistoryDelegate: AnyObject {
    func reloadData()
}

protocol OrderHistoryViewModelProtocol {
    var activeOrders: [OrderModel] {get set}
    var doneOrders: [OrderModel] {get set}
    var delegate: OrderHistoryDelegate? {get set}
    
    func getOrderHistory()
}

class OrderHistoryViewModel: OrderHistoryViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var activeOrders: [OrderModel] = []
    var doneOrders: [OrderModel] = []
    var delegate: OrderHistoryDelegate?
    
    func getOrderHistory() {
        networkService.sendRequest(successModelType: OrderHistoryModel.self,
                                   endpoint: MultiTarget(GeneralAPI.getOrderHistory)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                activeOrders = response.active
                doneOrders = response.done
                delegate?.reloadData()
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
