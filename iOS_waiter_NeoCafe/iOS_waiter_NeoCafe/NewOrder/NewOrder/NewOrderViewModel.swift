//
//  NewOrderViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderDelegate: AnyObject {
    func handleSuccessfulResponse()
}

protocol NewOrderViewModelProtocol {
    var delegate: NewOrderDelegate? { get set }
    
    var onProfileNavigate: EmptyCompletion? { get set }
    var onNoticeNavigate: EmptyCompletion? { get set }
    var onNewOrderDirectoryNavigate: ((Int)->Void)? { get set }
    
    var availableTables: [TableModel] { get set }

    func getAllProducts()
}

class NewOrderViewModel: NewOrderViewModelProtocol {
    
    @InjectionInjected(\.networkService) var networkService

    weak var delegate: NewOrderDelegate?
    
    var onProfileNavigate: EmptyCompletion?
    var onNoticeNavigate: EmptyCompletion?
    var onNewOrderDirectoryNavigate: ((Int)->Void)?
    
    // MARK: MOCK->API
//    var availableTables: [TableModel] = []
    var availableTables = MockTable.shared.mockTables
    
    func getAllProducts() {
        networkService.sendRequest(successModelType: AllProductsModel.self, endpoint: MultiTarget(NewOrderAPI.getAllProducts)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.handleSuccessfulResponse()
                }
                print(response)
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
