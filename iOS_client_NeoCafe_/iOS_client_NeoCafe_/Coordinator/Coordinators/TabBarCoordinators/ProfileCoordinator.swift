//
//  ProfileCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import Foundation
import UIKit

class ProfileCoordinator: BaseCoordinator {
    
    var onSearchNavigate: EmptyCompletion?

    private var mainVC: ProfileViewController!
    var tabBarCoordinator: TabBarCoordinator?

    override func start() {
        let viewModel = ProfileViewModel()
        viewModel.logOut = logout
        let viewController = ProfileViewController(viewModel: viewModel)
        mainVC = viewController
        viewController.tabBarItem.title = "Профиль"
        viewController.tabBarItem.image = UIImage(named: Asset.profile.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.profile.name)
        router.setRootModule(viewController, hideBar: false)
    } 
    
    func logout() {
        let coordinator = InitializationCoordinator(router: router)
        coordinator.start()
        coordinator.onAuthenticationNavigate = { [weak self, weak coordinator] in
            self?.removeChild(coordinator)
            self?.performMainFlow()
        }
        router.setRootModule(coordinator, hideBar: true)
    }
    
    func performMainFlow() {
        let coordinator = TabBarCoordinator(router: router)
        addChild(coordinator)
        coordinator.start()
        router.setRootModule(coordinator, hideBar: true)
    }
}
