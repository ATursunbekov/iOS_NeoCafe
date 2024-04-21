//
//  BranchDetailViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/3/24.
//

import Foundation

protocol BranchDetailViewModelDelegate: AnyObject {
    func getPopularResponse()
}

protocol BranchDetailViewModelProtocol {
    var popularProducts: [PopularProductModel] { get set }
    var delegate: BranchDetailViewModelDelegate? { get set }
    var goToMenuScreen: EmptyCompletion? { get set }
    func getPopular()
    func getTimeAsString(response: [WorkDays]) -> String
}

class BranchDetailViewModel: BranchDetailViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var popularProducts: [PopularProductModel] = []
    var delegate: BranchDetailViewModelDelegate?
    var goToMenuScreen: EmptyCompletion?

    func getPopular() {
        networkService.sendRequest(successModelType: [PopularProductModel].self, endpoint: MultiTarget(MenuAPI.getPopular)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                popularProducts = response
                delegate?.getPopularResponse()
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }

    func getTimeAsString(response: [WorkDays]) -> String {
        var res = ""
        for i in 0 ..< response.count {
            if i != response.count - 1 {
                res += "\(response[i].from) - \(response[i].to)\n"
            } else {
                res += "\(response[i].from) - \(response[i].to)"
            }
        }
        return res
    }
}
