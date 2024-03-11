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
    var categories: [CategoryModel] {get set}
    var selectedIndex: Int {get set}
    var categoryProduct: [PopularProductModel] {get set}
    var delegate: MenuViewModelDelegate? {get set}
    var goToDetailProductScreen: ((PopularProductModel) -> Void)? {get set}
    
    func getCategoryProducts(category: String)
}

class MenuViewModel: MenuViewModelProtocol {
    
    var goToDetailProductScreen: ((PopularProductModel) -> Void)?
    
    @InjectionInjected(\.networkService) var networkService
    var categories = [
        CategoryModel(name: "Кофе", image: Asset.categoryBeanItem.name),
        CategoryModel(name: "Десерты", image: Asset.categoryDesertItem.name),
        CategoryModel(name: "Выпечка", image: Asset.categoryCruasanItem.name),
        CategoryModel(name: "Напитки", image: Asset.categoryDrinkItem.name)
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
            case .success(let response):
                DispatchQueue.main.async {
                    self.delegate?.getCategoryObjects()
                }
                self.categoryProduct = response.responses
                print("Success")
            case .failure(let error):
                print("handle error: \(error)")
            }
        }
    }
}
