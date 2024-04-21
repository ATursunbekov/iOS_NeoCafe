//
//  InitializationCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import UIKit

final class InitializationCoordinator: BaseCoordinator {
    var onAuthenticationNavigate: EmptyCompletion?

    lazy var startController: UIViewController = {
        let viewModel = AuthViewModel()
        viewModel.onAuthNavigate = onAuthenticationNavigate
        let viewController = AuthViewController(viewModel: viewModel)
        router.setRootModule(viewController, hideBar: true)
        return viewController
    }()

    override var toPresent: UIViewController {
        startController
    }

    deinit {
        onAuthenticationNavigate = nil
    }
}
