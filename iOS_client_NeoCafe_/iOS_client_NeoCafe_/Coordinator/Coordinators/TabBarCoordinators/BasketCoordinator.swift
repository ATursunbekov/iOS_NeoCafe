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
        let viewController = BasketViewController(viewModel: BasketViewModel())
        mainVC = viewController
        viewController.tabBarItem.title = "Корзина"
        viewController.tabBarItem.image = UIImage(named: Asset.basket.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.basket.name)
        router.setRootModule(viewController, hideBar: false)
    }
}
