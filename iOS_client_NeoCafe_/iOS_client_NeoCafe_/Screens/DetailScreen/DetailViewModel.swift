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
    var productModel: PopularProductModel {get set}
    var popDetailScreen: EmptyCompletion? {get set}
    var delegate: DetailViewModelDelegate? {get set}
    var popularProducts: [PopularProductModel] {get set}
    var goToDetailProductScreen: ((PopularProductModel) -> Void)? {get set}
    
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
        networkService.sendRequest(successModelType: [PopularProductModel].self, endpoint: MultiTarget(MenuAPI.getPopular)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                popularProducts = response
                DispatchQueue.main.async {
                    self.delegate?.fetchRecommendation()
                }
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }

//    func getProductDetail() {
//        networkService.sendRequest(successModelType: PopularProductModel.self, endpoint: MultiTarget(MenuAPI.getProductDetail(productID))) { [weak self] result in
//            guard let self else { return }
//            switch result {
//            case .success(let response):
//                productDetail = response
//                DispatchQueue.main.async {
//                    self.delegate?.setData(model: response)
//                }
//            case .failure(let error):
//                print("handle error: \(error)")
//            }
//        }
//    }
}
