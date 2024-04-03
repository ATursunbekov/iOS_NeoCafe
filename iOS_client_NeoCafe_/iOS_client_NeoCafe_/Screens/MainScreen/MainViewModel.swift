//
//  MainViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 20/2/24.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func getPopularResponse()
}

protocol MainViewModelProtocol {
    var mainCategory: [CategoryModel] {get set}
    var popularProducts: [PopularProductModel] {get set}
    var delegate: MainViewModelDelegate? {get set}
    var goToMenuScreen: ((Int) -> Void)? {get set}
    var gotToProductDetailScreen: ((PopularProductModel) -> Void)? {get set}
    var goToSearchScreen: EmptyCompletion? {get set}
    var goToNotificationScreen: EmptyCompletion? {get set}
    func getPopular()
}

class MainViewModel: MainViewModelProtocol {
    
    var goToMenuScreen: ((Int) -> Void)?
    var gotToProductDetailScreen: ((PopularProductModel) -> Void)?
    var goToSearchScreen: EmptyCompletion?
    var goToNotificationScreen: EmptyCompletion?
    
    @InjectionInjected(\.networkService) var networkService
    var mainCategory: [CategoryModel] = [
        CategoryModel(name: "Кофе", image: Asset.cofe.name),
        CategoryModel(name: "Десерты", image: Asset.desert.name),
        CategoryModel(name: "Выпечка", image: Asset.bakering.name),
        CategoryModel(name: "Напитки", image: Asset.drink.name),
        CategoryModel(name: "Чай", image: Asset.tea.name)
    ]
    var popularProducts: [PopularProductModel] = []
    var delegate: MainViewModelDelegate?
    
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
