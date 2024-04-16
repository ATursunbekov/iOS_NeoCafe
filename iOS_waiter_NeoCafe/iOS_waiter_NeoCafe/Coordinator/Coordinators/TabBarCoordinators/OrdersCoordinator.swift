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
    }
    
    private func showOrderDetailsScreen(order: MockOrder) {
        let viewModel = OrderDetailsViewModel()
        viewModel.onBackNavigate = { [weak self] in
            self?.router.popModule(animated: true)
        }
        viewModel.onClosingOrderNavigate = { [weak self] order in
            self?.showClosingOrderScreen(order: order)
        }
        viewModel.onAddSupplementsNavigate = showCoffeeSupplementsScreen
        
        viewModel.onRemoveItemFromOrderNavigate = { [weak self] order in
            self?.showRemoveItemFromOrderScreen(order: order)
        }
        let viewController = OrderDetailsViewController(viewModel: viewModel)
        router.push(viewController, hideBottomBar: false)
        tabBarCoordinator?.hideShadowView()
    }
    
    private func showClosingOrderScreen(order: MockOrder) {
        let viewModel = ClosingOrderDrawerViewModel()
        viewModel.onSuccessfulClosingNavigate = { [weak self] in
            self?.router.popModule(animated: true)
        }
        let viewController = ClosingOrderDrawerViewController(viewModel: viewModel)
        router.showPopup(viewController, animated: true)
    }
    
    private func showCoffeeSupplementsScreen() {
        let viewModel = CoffeeSupplementsDrawerViewModel()
        viewModel.dismissModule = {
            self.router.dismissModule(animated: true)
        }
        let viewController = CoffeeSupplementsDrawerViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .overFullScreen
        router.present(viewController, animated: true)
    }
    
    private func showRemoveItemFromOrderScreen(order: MockOrder) {
        let viewModel = RemoveItemFromOrderModalViewModel()
        viewModel.popScreen = {
            self.router.dismissModule(animated: true)
        }
        let viewController = RemoveItemFromOrderModalViewController(viewModel: viewModel)
        router.showPopup(viewController, animated: true)
    }
    
    private func showSuccessfulClosingScreen() {
        let viewModel = SuccessfulClosingModalViewModel()
        viewModel.onOrdersNavigate = start
        
        let viewController = SuccessfulClosingModalViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .overFullScreen
        router.present(viewController, animated: true)
    }
    
    // MARK: - TODO
    private func showProfileScreen() {
        // TODO: -
    }
    
    private func showNoticeScreen() {
        // TODO: -
    }
    
}

