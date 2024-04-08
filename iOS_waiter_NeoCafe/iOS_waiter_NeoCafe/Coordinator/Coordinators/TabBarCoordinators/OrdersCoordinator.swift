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
        viewModel.onProfileNavigate = showProfileScreen
        viewModel.onNoticeNavigate = showNoticeScreen
        viewModel.onOrderDetailsNavigate = { [weak self] order in
            self?.showOrderDetailsScreen(order: order)
        }
        
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
    
    func showOrderDetailsScreen(order: MockOrder) {
        let viewModel = OrderDetailsViewModel()
        viewModel.onBackNavigate = { [weak self] in
            self?.router.popModule(animated: true)
        }
        viewModel.onClosingOrderNavigate = { [weak self] order in
            self?.showClosingOrderScreen(order: order)
        }
        viewModel.onAddSupplementsNavigate = showCoffeeSupplementsScreen
        viewModel.onRemoveItemFromOrderNavigate = showRemoveItemFromOrderScreen
        
        let viewController = OrderDetailsViewController(viewModel: viewModel)
        router.push(viewController, hideBottomBar: false)
        tabBarCoordinator?.hideShadowView()
    }
    
    func showClosingOrderScreen(order: MockOrder) {
        let viewModel = ClosingOrderDrawerViewModel()
        viewModel.onSuccessfulClosingNavigate = { [weak self] in
            self?.router.popModule(animated: true)
        }
        
        let viewController = ClosingOrderDrawerViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showCoffeeSupplementsScreen() {
        let viewModel = CoffeeSupplementsDrawerViewModel()
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        
        let viewController = CoffeeSupplementsDrawerViewController(viewModel: viewModel)
        router.present(viewController)
    }
    
    func showRemoveItemFromOrderScreen() {
        let viewModel = RemoveItemFromOrderViewModel()
        viewModel.onOrderDetailsNavigate = { [weak self] order in
            self?.showOrderDetailsScreen(order: order)
        }
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        
        let viewController = RemoveItemFromOrderModalViewController(viewModel: viewModel)
        router.present(viewController)
    }
    
    func showSuccessfulClosingScreen() {
        let viewModel = SuccessfulClosingModalViewModel()
        viewModel.onOrdersNavigate = start
        
        let viewController = SuccessfulClosingModalViewController(viewModel: viewModel)
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

