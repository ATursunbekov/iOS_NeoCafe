//
//  BranchCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import Foundation
import UIKit

class BranchCoordinator: BaseCoordinator {
    
    var onSearchNavigate: EmptyCompletion?

    private var mainVC: BranchViewController!
    var tabBarCoordinator: TabBarCoordinator?

    override func start() {
        let viewModel = MainViewModel()
        let viewController = BranchViewController()
        mainVC = viewController
        viewController.tabBarItem.title = "Филиалы"
        viewController.tabBarItem.image = UIImage(named: Asset.branch.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.branch.name)
        router.setRootModule(viewController, hideBar: false)
    }
}
