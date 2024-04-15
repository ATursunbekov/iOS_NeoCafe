//
//  AuthCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 27/03/24.
//

import UIKit

final class AuthCoordinator: BaseCoordinator {
    
    var onOrdersNavigate: EmptyCompletion?

    private lazy var startController: UIViewController = {

        let viewModel = AuthViewModel()
        viewModel.onOrdersNavigate = onOrdersNavigate
//        viewModel.onOrdersNavigate = showOrdersScreen

        let viewController = AuthViewController(viewModel: viewModel)

        router.setRootModule(viewController, hideBar: false)
        return viewController
    }()
    
    private func showOrdersScreen() {
        let viewModel = OrdersViewModel()
        
        let viewController = OrdersViewController(viewModel: viewModel)
        router.push(viewController)
    }

    override var toPresent: UIViewController {
        startController
    }

    deinit {
        onOrdersNavigate = nil
    }
}
