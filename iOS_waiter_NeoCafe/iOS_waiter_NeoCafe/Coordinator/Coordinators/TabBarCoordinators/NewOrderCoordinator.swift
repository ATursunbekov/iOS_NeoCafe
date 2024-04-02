////
////  NewOrderCoordinator.swift
////  iOS_waiter_NeoCafe
////
////  Created by iPak Tulane on 19/03/24.
////
//
//import Foundation
//import UIKit
//
//final class NewOrderCoordinator: BaseCoordinator {
//
//    private var newOrderViewController: NewOrderViewController!
//    var tabBarCoordinator: TabBarCoordinator?
//    
//    override func start() {
//        let viewModel = NewOrderViewModel()
//        viewModel.onProfileNavigate = showProfileScreen
//        viewModel.onNoticeNavigate = showNoticeScreen
//        viewModel.onNewOrderDirectoryNavigate = { [weak self] tableIndex in
//            self?.showNewOrderDirectoryScreen(at: tableIndex)
//        }
//        let viewController = NewOrderViewController(viewModel: viewModel)
//        newOrderViewController = viewController
//        viewController.tabBarItem.title = "Новый заказ"
//        viewController.tabBarItem.image = UIImage(named: "newOrderNormal")
//        viewController.tabBarItem.selectedImage = UIImage(named: "newOrderSelected")
//        router.setRootModule(viewController, hideBar: false)
//    }
//    
//    func showNewOrderDirectoryScreen(at index: Int) {
//        let viewModel = NewOrderDirectoryViewModel()
//        let viewController = NewOrderDirectoryViewController(viewModel: viewModel)
//        router.push(viewController)
//    }
//    
////    func showNewOrderCoffeeSupplementsDrawerScreen(product: CoffeeProduct) {
//    func showNewOrderCoffeeSupplementsDrawerScreen(product: ProductModel) {
//        let viewModel = NewOrderCoffeeSupplementsDrawerViewModel()
//
//        let viewController = NewOrderCoffeeSupplementsDrawerViewController(viewModel: viewModel)
//        router.push(viewController, hideBottomBar: true)
//        tabBarCoordinator?.hideShadowView()
//    }
//    
//    func showNewOrderInfoDrawerScreen(order: MockOrder) {
//        let viewModel = NewOrderInfoDrawerViewModel()
//
//        let viewController = NewOrderInfoDrawerViewController(viewModel: viewModel)
//        router.push(viewController, hideBottomBar: true)
//        tabBarCoordinator?.hideShadowView()
//    }
//    
//    func showNewOrderSearchScreen() {
//        let viewModel = NewOrderSearchViewModel()
//        let viewController = NewOrderSearchViewController(viewModel: viewModel)
//        router.push(viewController)
//    }
//    
//    func showNewOrderPlacementScreen() {
//        let viewModel = NewOrderPlacementViewModel()
//        let viewController = NewOrderPlacementViewController(viewModel: viewModel)
//        router.push(viewController)
//    }
//    
//    // MARK: - TODO
//    func showProfileScreen() {
//        // TODO: -
//    }
//    
//    func showNoticeScreen() {
//        // TODO: -
//    }
//    
//}
//
