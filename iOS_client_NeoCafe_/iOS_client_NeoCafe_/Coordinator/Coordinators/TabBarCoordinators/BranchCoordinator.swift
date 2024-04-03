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
        let viewModel = BranchViewModel()
        viewModel.navigateToBranchDetail = goToBranchDetailScreen
        let viewController = BranchViewController(viewModel: viewModel)
        mainVC = viewController
        viewController.tabBarItem.title = "Филиалы"
        viewController.tabBarItem.image = UIImage(named: Asset.branch.name)
        viewController.tabBarItem.selectedImage = UIImage(named: Asset.branch.name)
        router.setRootModule(viewController, hideBar: false)
    }
    
    func goToBranchDetailScreen(branchData: BranchResponses) {
        let viewModel = BranchDetailViewModel()
        viewModel.goToMenuScreen = goToMainTab
        let viewController = BranchDetailViewController(viewModel: viewModel, response: branchData)
        tabBarCoordinator?.hideShadowView()
        router.push(viewController, hideBottomBar: true)
    }
    
    func goToMainTab() {
        let viewModel = MenuViewModel(selectedIndex: 0)
        viewModel.goToDetailProductScreen = goToProductDetailScreen
        let viewController = MenuViewController(viewModel: viewModel)
        router.push(viewController, animated: true)
    }
    
    func goToProductDetailScreen(product: PopularProductModel) {
        let viewModel = DetailViewModel(productModel: product)
        viewModel.goToDetailProductScreen = goToProductDetailScreen
        let vc = DetailViewController(viewModel: viewModel)
        router.push(vc, hideBottomBar: true)
        tabBarCoordinator?.hideShadowView()
    }
}
