//
//  NewOrderCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//
  
import UIKit

final class NewOrderCoordinator: BaseCoordinator {
    
    private var newOrderViewController: NewOrderViewController!
    var tabBarCoordinator: TabBarCoordinator?
    
    override func start() {
        let viewModel = NewOrderViewModel()
        viewModel.onProfileNavigate = showProfileScreen
        viewModel.onNoticeNavigate = showNoticeScreen
        viewModel.onNewOrderDirectoryNavigate = { [weak self] tableIndex in
            self?.showNewOrderDirectoryScreen(at: tableIndex)
        }
        let viewController = NewOrderViewController(viewModel: viewModel)
        newOrderViewController = viewController
        viewController.tabBarItem.title = "Новый заказ"
        viewController.tabBarItem.image = UIImage(named: "newOrderNormal")
        viewController.tabBarItem.selectedImage = UIImage(named: "newOrderSelected")
        router.setRootModule(viewController, hideBar: false)
    }
    
    func showNewOrderDirectoryScreen(at index: Int) {
        let viewModel = NewOrderDirectoryViewModel()
        viewModel.onBackNavigate = { [weak self] in
            self?.router.popModule(animated: true)
        }
        viewModel.onNewOrderSearchNavigate = showNewOrderSearchScreen
        viewModel.onNewOrderInfoDrawerNavigate = { [weak self] order in
            self?.showNewOrderInfoDrawerScreen(order: order)
        }
        let viewController = NewOrderDirectoryViewController(viewModel: viewModel)
//        router.push(viewController)
        router.push(viewController, hideBottomBar: true)
    }
    
    func showNewOrderInfoDrawerScreen(order: MockOrder) {
        let viewModel = NewOrderInfoDrawerViewModel()
        viewModel.onOrderPlacementNavigate = showNewOrderPlacementScreen
        let viewController = NewOrderInfoDrawerViewController(viewModel: viewModel)
        router.push(viewController, hideBottomBar: false)
        tabBarCoordinator?.hideShadowView()
    }
    
    func showNewOrderPlacementScreen() {
        let viewModel = NewOrderPlacementViewModel()
        viewModel.onNewOrderNavigate = start
        let viewController = NewOrderPlacementViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showNewOrderSearchScreen() {
        let viewModel = NewOrderSearchViewModel()
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        let viewController = NewOrderSearchViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showNewOrderCoffeeSupplementsDrawerScreen(product: ProductModel) {
        let viewModel = NewOrderCoffeeSupplementsDrawerViewModel()
        viewModel.popScreen = {
            self.router.popModule(animated: true)
        }
        let viewController = NewOrderCoffeeSupplementsDrawerViewController(viewModel: viewModel)
        router.push(viewController, hideBottomBar: false)
        tabBarCoordinator?.hideShadowView()
    }
    
    // MARK: - TODO
    func showProfileScreen() {
        // TODO: -
    }
    
    func showNoticeScreen() {
        // TODO: -
    }
}



