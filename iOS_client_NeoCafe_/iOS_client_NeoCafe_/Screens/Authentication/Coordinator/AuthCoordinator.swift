//
//  AuthenticationCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import Foundation
import UIKit

final class AuthCoordinator: NSObject, Coordinator, ParentCoordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    lazy var viewModel: AuthViewModelProtocol! = {
        let viewModel = AuthViewModel()
        return viewModel
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        viewModel.coordinator = self
        let authViewController = AuthViewController(viewModel: viewModel)
        navigationController.pushViewController(authViewController, animated: animated)
    }
}
