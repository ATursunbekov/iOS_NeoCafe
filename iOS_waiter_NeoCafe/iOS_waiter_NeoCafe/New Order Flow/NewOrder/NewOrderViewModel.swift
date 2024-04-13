//
//  NewOrderViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import Foundation

protocol NewOrderViewModelProtocol {
    // MARK: - Navigation
    var onProfileNavigate: EmptyCompletion? { get set }
    var onNoticeNavigate: EmptyCompletion? { get set }
    var onNewOrderDirectoryNavigate: ((Int)->Void)? { get set }
    
    // MARK: - Data
    var tables: [MockTable] { get set }
    
    func getTablesCount() -> Int
}

class NewOrderViewModel: NewOrderViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService

    // MARK: - Navigation
    var onProfileNavigate: EmptyCompletion?
    var onNoticeNavigate: EmptyCompletion?
    var onNewOrderDirectoryNavigate: ((Int)->Void)?
    
    // MARK: - Data
    var tables = MockData.shared.tables
    
    func getTablesCount() -> Int {
        tables.count
    }
}


