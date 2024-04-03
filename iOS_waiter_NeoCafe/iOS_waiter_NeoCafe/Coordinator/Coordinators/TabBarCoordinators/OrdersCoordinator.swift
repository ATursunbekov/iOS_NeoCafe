//
//  OrdersCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

final class OrdersCoordinator: BaseCoordinator {

    private var ordersViewController: OrdersViewController!
    var tabBarCoordinator: TabBarCoordinator?
    
    override func start() {
        let viewModel = OrdersViewModel()
        viewModel.onDetailsNavigate = { [weak self] order in
            self?.showDetailsScreen(order: order)
        }
        viewModel.onProfileNavigate = showProfileScreen
        viewModel.onNoticeNavigate = showNoticeScreen
        let viewController = OrdersViewController(viewModel: viewModel)
        ordersViewController = viewController
        viewController.tabBarItem.title = "Заказы"
        viewController.tabBarItem.image = UIImage(named: "ordersNormal")
        viewController.tabBarItem.selectedImage = UIImage(named: "ordersSelected")
        router.setRootModule(viewController, hideBar: false)

//        router.push(viewController, hideBottomBar: false)
        
//        router.push(viewController, hideBottomBar: false)
//        tabBarCoordinator?.hideShadowView()
    }
    
    func showDetailsScreen(order: MockOrder) {
        let viewModel = OrderDetailsViewModel()
        viewModel.onBackScreenNavigate = { [weak self] in
            self?.router.popModule(animated: true)
        }
        viewModel.onAddSupplementsScreenNavigate = showCoffeeSupplementsScreen
        viewModel.onClosingOrderScreenNavigate = { [weak self] order in
            self?.showClosingOrderScreen(order: order)
        }
        let viewController = OrderDetailsViewController(viewModel: viewModel)
        router.push(viewController, hideBottomBar: false)
        tabBarCoordinator?.hideShadowView()
    }
    
    func showClosingOrderScreen(order: MockOrder) {
        let viewModel = ClosingOrderDrawerViewModel()
        viewModel.onScreenDismissal = { [weak self] in
            self?.router.popModule(animated: true)
        }
        let viewController = ClosingOrderDrawerViewController(viewModel: viewModel)
        router.push(viewController)
    }

    // MARK: - Screens w/o view models
    
    func showCoffeeSupplementsScreen() {
        let viewController = CoffeeSupplementsDrawerViewController()
        router.present(viewController)
    }
    
    func showRemoveItemFromOrderScreen() {
        let viewController = RemoveItemFromOrderModalViewController()
        router.present(viewController)
    }
    
    func showSuccessfulClosingScreen() {
        let viewController = SuccessfulClosingModalViewController()
        router.present(viewController)
    }
    
    // MARK: - TODO
    func showProfileScreen() {
        // TODO: -
    }
    
    func showNoticeScreen() {
        // TODO: -
    }
    
}

