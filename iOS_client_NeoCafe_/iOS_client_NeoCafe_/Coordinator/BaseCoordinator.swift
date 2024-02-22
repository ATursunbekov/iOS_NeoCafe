//
//  BaseCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 4/2/24.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start(animated: Bool)

    func popViewController()
}

extension Coordinator {
    func popViewController() { navigationController.popViewController(animated: true) }

    func popToRootViewController() { navigationController.popToRootViewController(animated: true) }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }

    func addChild(_ child: Coordinator)

    func childDidFinish(_ child: Coordinator)
}

extension ParentCoordinator {
    func addChild(_ child: Coordinator) { childCoordinators.append(child) }

    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

protocol ChildCoordinator: Coordinator {
    func coordinatorDidFinish()
}
