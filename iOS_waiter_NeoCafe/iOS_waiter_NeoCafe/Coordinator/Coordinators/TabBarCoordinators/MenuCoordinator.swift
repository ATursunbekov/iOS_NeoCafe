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
        let viewController = MenuViewController(viewModel: viewModel)
        menuViewController = viewController
        viewController.tabBarItem.title = "Меню"
        viewController.tabBarItem.image = UIImage(named: "menuNormal")
        viewController.tabBarItem.selectedImage = UIImage(named: "menuSelected")
        router.setRootModule(viewController, hideBar: false)
    }
    
}
