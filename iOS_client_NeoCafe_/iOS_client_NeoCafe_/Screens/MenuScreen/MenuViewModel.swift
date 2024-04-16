//
//  MenuViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import Foundation

protocol MenuViewModelDelegate: AnyObject {
    func getCategoryObjects()
}

protocol MenuViewModelProtocol {
    var categories: [CategoryModel] { get set }
    var selectedIndex: Int { get set }
    var categoryProduct: [PopularProductModel] { get set }
    var delegate: MenuViewModelDelegate? { get set }
    var goToDetailProductScreen: ((PopularProductModel) -> Void)? { get set }
    func getCategoryProducts(category: String)
    func getCategoryName(index: Int) -> String
}

class MenuViewModel: MenuViewModelProtocol {
    var goToDetailProductScreen: ((PopularProductModel) -> Void)?

    @InjectionInjected(\.networkService) var networkService
    var categories = [
        CategoryModel(name: "Кофе", image: Asset.categoryBeanItem.name),
        CategoryModel(name: "Десерты", image: Asset.categoryDesertItem.name),
        CategoryModel(name: "Выпечка", image: Asset.categoryCruasanItem.name),
        CategoryModel(name: "Напитки", image: Asset.categoryDrinkItem.name),
    ]
    var delegate: MenuViewModelDelegate?
    var categoryProduct: [PopularProductModel] = []
    var selectedIndex = 0

    init(selectedIndex: Int = 0) {
        self.selectedIndex = selectedIndex
    }

    func getCategoryProducts(category: String) {
        networkService.sendRequest(successModelType: MenuCategoryProducts.self, endpoint: MultiTarget(MenuAPI.getCategoryProducts(category))) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.delegate?.getCategoryObjects()
                }
                self.categoryProduct = response.responses
                print("Success")
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }

    func getCategoryName(index: Int) -> String {
        switch index {
        case 0:
            return "кофе"
        case 1:
            return "десерты"
        case 2:
            return "выпечка"
        case 3:
            return "напитки"
        default:
            return "чай"
        }
    }
}
