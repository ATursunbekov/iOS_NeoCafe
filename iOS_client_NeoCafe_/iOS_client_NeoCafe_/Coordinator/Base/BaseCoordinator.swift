//
//  BaseCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 4/2/24.
//

import UIKit

typealias EmptyCompletion = () -> Void
typealias BoolCompletion = (Bool) -> Void

protocol Coordinator: AnyObject, Presentable {
    func start()
}

class BaseCoordinator: Coordinator {
    var onComplete: EmptyCompletion?

    let router: Router
    var childCoordinators: [Coordinator] = []

    init(router: Router) {
        self.router = router
    }

    deinit {
        onComplete = nil
    }

    func start() {}

    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else { return }

        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeChild($0) }
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    var toPresent: UIViewController {
        router.toPresent
    }
}
