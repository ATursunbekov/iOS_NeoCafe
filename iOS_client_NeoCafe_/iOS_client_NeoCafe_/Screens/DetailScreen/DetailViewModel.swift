//
//  DetailViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 7/3/24.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func fetchRecommendation()
}

protocol DetailViewModelProtocol {
    var productModel: PopularProductModel { get set }
    var popDetailScreen: EmptyCompletion? { get set }
    var delegate: DetailViewModelDelegate? { get set }
    var popularProducts: [PopularProductModel] { get set }
    var goToDetailProductScreen: ((PopularProductModel) -> Void)? { get set }

    func getPopular()
}

class DetailViewModel: DetailViewModelProtocol {
    var productModel: PopularProductModel
    var popularProducts: [PopularProductModel] = []
    var popDetailScreen: EmptyCompletion?
    var delegate: DetailViewModelDelegate?
    @InjectionInjected(\.networkService) var networkService
    var goToDetailProductScreen: ((PopularProductModel) -> Void)?

    init(productModel: PopularProductModel) {
        self.productModel = productModel
    }

    func getPopular() {
        networkService.sendRequest(
            successModelType: [PopularProductModel].self,
            endpoint: MultiTarget(MenuAPI.getPopular)
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                popularProducts = response
                DispatchQueue.main.async {
                    self.delegate?.fetchRecommendation()
                }
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
}
