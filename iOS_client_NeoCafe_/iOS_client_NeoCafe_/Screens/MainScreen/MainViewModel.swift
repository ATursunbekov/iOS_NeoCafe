//
//  MainViewModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 20/2/24.
//

import Foundation

protocol MainViewModelProtocol {
    var mainCategory: [CategoryModel] {get set}
}

class MainViewModel: MainViewModelProtocol {
    var mainCategory: [CategoryModel] = [
        CategoryModel(name: "Кофе", image: Asset.cofe.name),
        CategoryModel(name: "Десерты", image: Asset.desert.name),
        CategoryModel(name: "Выпечка", image: Asset.bakering.name),
        CategoryModel(name: "Напитки", image: Asset.drink.name),
        CategoryModel(name: "Чай", image: Asset.tea.name)
    ]
}
