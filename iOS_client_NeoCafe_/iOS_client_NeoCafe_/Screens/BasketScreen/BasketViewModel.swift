//
//  BasketViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 26/3/24.
//

import Foundation

protocol BasketDelegate: AnyObject {
    func clearData()
}

protocol BasketViewModelProtocol {
    var delegate: BasketDelegate? {get set}
    var goToMainScreen: EmptyCompletion? {get set}
    func makeOrder(bonus: Int)
}

class BasketViewModel: BasketViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var delegate: BasketDelegate?
    var goToMainScreen: EmptyCompletion?
    
    func makeOrder(bonus: Int) {
        networkService.sendRequest(successModelType: String.self, endpoint: MultiTarget(GeneralAPI.makeOrder(order: geatherAllData(bonus: bonus)))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(_):
                print("Successful: request")
                DispatchQueue.main.async {
                    self.delegate?.clearData()
                }
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
    
    func geatherAllData(bonus: Int) -> BasketModel {
        var price = 0
        var orderDetail: [OrderDetailModel] = []
        for i in DataManager.shared.getAllProducts() {
            let amount = DataManager.shared.getQuantity(of: i)
            price += i.price * amount
            orderDetail.append(OrderDetailModel(productId: i.id, quantity: amount, additions: []))
        }
        price -= bonus
        let basket = BasketModel(price: price, filialId: 1, orderDetails: orderDetail)
        return basket
    }
}
