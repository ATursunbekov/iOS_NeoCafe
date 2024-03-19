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
    var popularProducts: [PopularProductModel] {get set}
    var delegate: BranchDetailViewModelDelegate? {get set}
    func getPopular()
}

class BranchDetailViewModel: BranchDetailViewModelProtocol {
    @InjectionInjected(\.networkService) var networkService
    var popularProducts: [PopularProductModel] = []
    var delegate: BranchDetailViewModelDelegate?
    
    func getPopular() {
        networkService.sendRequest(successModelType: [PopularProductModel].self, endpoint: MultiTarget(MenuAPI.getPopular)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                popularProducts = response
                delegate?.getPopularResponse()
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
