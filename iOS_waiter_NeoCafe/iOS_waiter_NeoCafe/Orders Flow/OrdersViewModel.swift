//
//  OrdersViewModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Foundation

protocol OrdersDelegate: AnyObject {
    func availableTablesResponse()
    func tableInfoResponse()
}

protocol OrdersViewModelProtocol {
    var isOnTablesSegment: Bool {get set}
    var delegate: OrdersDelegate? {get set}
    var goToProfileScreen: EmptyCompletion? {get set}
    var goToNoticeScreen: EmptyCompletion? {get set}
    var goToDetailsScreen: ((Int)->Void)? {get set}
    
    var availableTables: [TableModel] {get set}
    var orderStates: [OrderStateModel] {get set}
    var tables: [TableInfoModel] {get set}
    var orderStateSelectedIndex: Int {get set}
    
    func changeSegment()
    func fetchAvailableTablesData()
    func fetchTableInfoData(by orderState: OrderState)
}

class OrdersViewModel: OrdersViewModelProtocol {

    var orderStateSelectedIndex: Int = 0
    
    init(selectedIndex: Int = 0) {
        self.orderStateSelectedIndex = selectedIndex
    }
    
    @InjectionInjected(\.networkService) var networkService

    var isOnTablesSegment = true
    var delegate: OrdersDelegate?
    
    var goToProfileScreen: EmptyCompletion? // TODO: - via Coordinator
    var goToNoticeScreen: EmptyCompletion? // TODO: - via Coordinator
    var goToDetailsScreen: ((Int)->Void)? // TODO: - via Coordinator
    
    var availableTables = [
        TableModel(number: 1, status: .reserved),
        TableModel(number: 2, status: .vacant),
        TableModel(number: 3, status: .reserved),
        TableModel(number: 4, status: .vacant),
        TableModel(number: 5, status: .reserved),
        TableModel(number: 6, status: .vacant),
        TableModel(number: 7, status: .reserved),
        TableModel(number: 8, status: .vacant),
        TableModel(number: 9, status: .reserved),
        TableModel(number: 10, status: .vacant),
        TableModel(number: 11, status: .reserved),
        TableModel(number: 12, status: .vacant),
        TableModel(number: 13, status: .reserved),
        TableModel(number: 14, status: .vacant),
        TableModel(number: 15, status: .reserved),
    ]
    
    var orderStates = [
        OrderStateModel(title: OrderState.all.rawValue),
        OrderStateModel(title: OrderState.new.rawValue),
        OrderStateModel(title: OrderState.inProcess.rawValue),
        OrderStateModel(title: OrderState.ready.rawValue),
        OrderStateModel(title: OrderState.cancelled.rawValue),
        OrderStateModel(title: OrderState.finished.rawValue),
    ]
    
    var tables = [
        TableInfoModel(id: 23144, number: 1, orderState: .inProcess, time: "19:02"),
        TableInfoModel(id: 23144, number: 2, orderState: .new, time: "19:02"),
        TableInfoModel(id: 23144, number: 3, orderState: .ready, time: "19:02"),
        TableInfoModel(id: 23144, number: 4, orderState: .cancelled, time: "19:02"),
        TableInfoModel(id: 23144, number: 5, orderState: .finished, time: "19:02"),
        TableInfoModel(id: 23144, number: 6, orderState: .inProcess, time: "19:02"),
        TableInfoModel(id: 23144, number: 7, orderState: .new, time: "19:02"),
        TableInfoModel(id: 23144, number: 8, orderState: .ready, time: "19:02"),
        TableInfoModel(id: 23144, number: 9, orderState: .cancelled, time: "19:02"),
        TableInfoModel(id: 23144, number: 10, orderState: .finished, time: "19:02"),
    ]
    
    func changeSegment() {
        isOnTablesSegment.toggle()
    }
    
    func fetchAvailableTablesData() {
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
    
    func fetchTableInfoData(by orderState: OrderState) {
//        networkService.sendRequest(successModelType: TableInfoModel.self, endpoint: MultiTarget(AuthAPI.fetchTableInfoData())) { [weak self] result in
//            guard let self else { return }
//            switch result {
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.delegate?.tableInfoResponse()
//                }
//                print(response)
//            case .failure(let error):
//                print("handle error: \(error)")
//            }
//        }
    }
}