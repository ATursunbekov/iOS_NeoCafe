//
//  ClosingOrderDrawerViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 26/03/24.
//

import UIKit

protocol ClosingOrderDrawerDelegate: AnyObject {
    func handleSuccessfulResponse()
}

protocol ClosingOrderDrawerViewModelProtocol {
    var delegate: ClosingOrderDrawerDelegate? {get set}
    var closingOrderItems: [ClosingOrderModel] {get set}
        
    var onScreenDismissal: EmptyCompletion? {get set}
    
    func fetchData()
    func calculateTotalPrice() -> String
}

class ClosingOrderDrawerViewModel: ClosingOrderDrawerViewModelProtocol {
        
    @InjectionInjected(\.networkService) var networkService

    var onScreenDismissal: EmptyCompletion?
    
    weak var delegate: ClosingOrderDrawerDelegate?
    
    var totalPriceValue = 0
    
    var closingOrderItems = [
        ClosingOrderModel(name: "Латте",
                          pricePerItem: 100,
                          quantity: 1),
        ClosingOrderModel(name: "Раф",
                          pricePerItem: 200,
                          quantity: 2),
        ClosingOrderModel(name: "Круассан",
                          pricePerItem: 300,
                          quantity: 3),
    ]
    
    func fetchData() {
//        networkService.sendRequest(successModelType: TableModel.self, endpoint: MultiTarget(AuthAPI.fetchAvailableTablesData())) { [weak self] result in
//            guard let self else { return }
//            switch result {
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.delegate?.availableTablesResponse()
//                }
//                print(response)
//            case .failure(let error):
//                print("handle error: \(error)")
//            }
//        }
    }
    
    func calculateTotalPrice() -> String {
        for item in closingOrderItems {
            totalPriceValue += item.subtotalPrice
        }
        return String(totalPriceValue)
    }
    
    
}



