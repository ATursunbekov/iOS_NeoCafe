//
//  NewOrderDirectoryViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderDirectoryDelegate: AnyObject {
    func handleSuccessfulResponse()
}

protocol NewOrderDirectoryViewModelProtocol {
    var delegate: NewOrderDirectoryDelegate? { get set }
    
    var onBackNavigate: EmptyCompletion? { get set }
    var onSearchNavigate: EmptyCompletion? { get set }
    
    var onNewOrderInfoDrawerNavigate: ((Int)->Void)? { get set }
    
    var selectedIndex: Int { get set }
    var availableTables: [TableModel] { get set }

    func getAllProducts()
}

class NewOrderDirectoryViewModel: NewOrderDirectoryViewModelProtocol {
    
    @InjectionInjected(\.networkService) var networkService

    weak var delegate: NewOrderDirectoryDelegate?
    
    var onProfileNavigate: EmptyCompletion?
    var onNoticeNavigate: EmptyCompletion?
    var onNewOrderDirectoryNavigate: ((Int)->Void)?
    
    var selectedIndex: Int = 0
    
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

