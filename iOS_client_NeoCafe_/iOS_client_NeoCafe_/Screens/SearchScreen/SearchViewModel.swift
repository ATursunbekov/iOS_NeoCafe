//
//  SearchViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 8/3/24.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func searchProductResponse()
}

protocol SearchViewModelProtocol {
    var popScreen: EmptyCompletion? {get set}
    var foundProducts: [PopularProductModel] {get set}
    var goToDetailScreen: ((PopularProductModel) -> Void)? {get set}
    var delegate: SearchViewModelDelegate? {get set}
    func searchProducts(text: String)
}

class SearchViewModel: SearchViewModelProtocol {

    var popScreen: EmptyCompletion?
    var goToDetailScreen: ((PopularProductModel) -> Void)?
    
    var foundProducts: [PopularProductModel] = []
    var delegate: SearchViewModelDelegate?
    @InjectionInjected(\.networkService) var networkService
    
    func searchProducts(text: String) {
        networkService.sendRequest(successModelType: MenuCategoryProducts.self, endpoint: MultiTarget(MenuAPI.getSearchProducts(text))) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.searchProductResponse()
                }
                foundProducts = response.responses
                print("Success: \(response.allCount)")
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
