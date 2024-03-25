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
        let viewModel = MainViewModel()
        let viewController = ProfileViewController(viewModel: ProfileViewModel())
        mainVC = viewController
        viewController.tabBarItem.title = "Профиль"
        viewController.tabBarItem.image = UIImage(named: Asset.profile.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.profile.name)
        router.setRootModule(viewController, hideBar: false)
    }
}
