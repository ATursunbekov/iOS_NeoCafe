//
//  BasketCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import Foundation
import UIKit

class BasketCoordinator: BaseCoordinator {
    var onSearchNavigate: EmptyCompletion?

    private var mainVC: BasketViewController!
    var tabBarCoordinator: TabBarCoordinator?

    override func start() {
        let viewModel = BasketViewModel()
        viewModel.goToMainScreen = goToMainTab
        let viewController = BasketViewController(viewModel: viewModel)
        mainVC = viewController
        viewController.tabBarItem.title = "Корзина"
        viewController.tabBarItem.image = UIImage(named: Asset.basket.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.basket.name)
        router.setRootModule(viewController, hideBar: false)
    }

    func goToMainTab() {
        let viewModel = MenuViewModel(selectedIndex: 0)
        viewModel.goToDetailProductScreen = goToProductDetailScreen
        let viewController = MenuViewController(viewModel: viewModel)
        router.push(viewController, animated: true)
    }

    func goToProductDetailScreen(product: PopularProductModel) {
        let viewModel = DetailViewModel(productModel: product)
        viewModel.goToDetailProductScreen = goToProductDetailScreen
        let viewController = DetailViewController(viewModel: viewModel)
        router.push(viewController, hideBottomBar: true)
        tabBarCoordinator?.hideShadowView()
    }
}
