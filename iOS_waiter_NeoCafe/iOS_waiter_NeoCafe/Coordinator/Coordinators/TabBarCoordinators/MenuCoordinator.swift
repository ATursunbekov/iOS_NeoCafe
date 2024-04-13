//
//  MenuCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

final class MenuCoordinator: BaseCoordinator {
    
    private var menuViewController: MenuViewController!
    var tabBarCoordinator: TabBarCoordinator?
    
    override func start() {
        let viewModel = MenuViewModel()
        viewModel.onProfileNavigate = showProfileScreen
        viewModel.onNoticeNavigate = showNoticeScreen
        viewModel.onMenuSearchNavigate = showMenuSearchScreen
        let viewController = MenuViewController(viewModel: viewModel)
        menuViewController = viewController
        viewController.tabBarItem.title = "Меню"
        viewController.tabBarItem.image = UIImage(named: "menuNormal")
        viewController.tabBarItem.selectedImage = UIImage(named: "menuSelected")
        router.setRootModule(viewController, hideBar: false)
    }
    
    func showMenuSearchScreen() {
        let viewModel = MenuSearchViewModel()
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        let viewController = MenuSearchViewController(viewModel: viewModel)
        router.present(viewController)
    }
    
    func showProfileScreen() {
        // TODO: -
    }
    
    func showNoticeScreen() {
        // TODO: -
    }
}
