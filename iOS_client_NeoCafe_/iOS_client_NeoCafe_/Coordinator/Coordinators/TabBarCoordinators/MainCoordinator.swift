//
//  MainCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import Foundation
import UIKit

final class MainCoordinator: BaseCoordinator {

    var onSearchNavigate: EmptyCompletion?

    private var mainVC: MainViewController!
    var tabBarCoordinator: TabBarCoordinator?

    override func start() {
        let viewModel = MainViewModel()
        viewModel.goToMenuScreen = goToMenuScreen
        viewModel.gotToProductDetailScreen = goToProductDetailScreen
        viewModel.goToSearchScreen = goToSearchScreen
        viewModel.goToNotificationScreen = goToNotificationScreen
        let viewController = MainViewController(viewModel: viewModel)
        mainVC = viewController
        viewController.tabBarItem.title = "Главная"
        viewController.tabBarItem.image = UIImage(named: Asset.home.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.home.name)
        router.setRootModule(viewController, hideBar: false)
    }
    
    func goToMenuScreen(index: Int = 0) {
        let viewModel = MenuViewModel(selectedIndex: index)
        viewModel.goToDetailProductScreen = goToProductDetailScreen
        let viewController = MenuViewController(viewModel: viewModel)
        router.push(viewController, animated: true)
//        router.push(viewController, hideBottomBar: true)
//        tabBarCoordinator?.hideShadowView()
    }
    
    func goToProductDetailScreen(product: PopularProductModel) {
        let viewModel = DetailViewModel(productModel: product)
        viewModel.goToDetailProductScreen = goToProductDetailScreen
        let vc = DetailViewController(viewModel: viewModel)
        router.push(vc, hideBottomBar: true)
        tabBarCoordinator?.hideShadowView()
    }
    
    func goToSearchScreen() {
        let viewModel = SearchViewModel()
        viewModel.goToDetailScreen = goToProductDetailScreen
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        let vc = SearchViewController(viewModel: viewModel)
        router.push(vc, animated: true)
    }
    
    func goToNotificationScreen() {
        let viewModel = NotificationViewModel()
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        let viewController = NotificationViewController(viewModel: viewModel)
        router.push(viewController, animated: true)
    }
}
