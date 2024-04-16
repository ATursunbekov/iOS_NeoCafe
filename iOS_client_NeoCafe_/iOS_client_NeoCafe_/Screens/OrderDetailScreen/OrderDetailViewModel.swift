//
//  OrderDetailViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 29/3/24.
//

import Foundation

protocol OrderHistoryDetailDelegate: AnyObject {
    func reloadData()
}

protocol OrderHistoryDetailViewModelProtocol {
    var orderDetail: [OrderHistoryDetailModel] { get set }
    var delegate: OrderHistoryDetailDelegate? { get set }

    func getOrderHistoryDetail()
}

class OrderHistoryDetailViewModel: OrderHistoryDetailViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var orderDetail: [OrderHistoryDetailModel] = []
    var delegate: OrderHistoryDetailDelegate?
    var id: Int

    init(id: Int) {
        self.id = id
    }

    func getOrderHistoryDetail() {
        networkService.sendRequest(successModelType: [OrderHistoryDetailModel].self,
                                   endpoint: MultiTarget(GeneralAPI.getOrderHistoryDetail(id: id)))
        { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                orderDetail = response
                delegate?.reloadData()
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
}
