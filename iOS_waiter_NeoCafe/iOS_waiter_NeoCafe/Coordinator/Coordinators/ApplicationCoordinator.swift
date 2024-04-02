//
//  ApplicationCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

final class ApplicationCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    
    override init(
        router: Router = RouterImpl()) {
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                fatalError("Window scene is required")
            }
            self.window = .init(windowScene: scene)
            super.init(router: router)
            
            setupColors()
            
            window.rootViewController = router.navigationController
            window.makeKeyAndVisible()
    }
    
    override func start() {
        if !isUserRegistered() {
            performAuthFlow()
        } else {
            performOrdersFlow()
        }
    }
    
    func isUserRegistered() -> Bool {
        let accessToken = DataManager.shared.tokens.accessToken
        return !accessToken.isEmpty
    }

    func performAuthFlow() {
        let coordinator = AuthCoordinator(router: router)
        addChild(coordinator)
        coordinator.start()
        coordinator.onOrdersNavigate = { [weak self, weak coordinator] in
            self?.removeChild(coordinator)
            self?.performOrdersFlow()
        }
        router.setRootModule(coordinator, hideBar: true)
    }
    
    func performOrdersFlow() {
        let coordinator = TabBarCoordinator(router: router)
        addChild(coordinator)
        coordinator.start()
        router.setRootModule(coordinator, hideBar: false)
    }
    
    private func setupColors() {
        window.tintColor = .white
    }
}
