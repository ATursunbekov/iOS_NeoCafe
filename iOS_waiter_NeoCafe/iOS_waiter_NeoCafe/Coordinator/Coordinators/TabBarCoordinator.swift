//
//  TabBarCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {

    var ordersCoordinator: OrdersCoordinator?
    var newOrderCoordinator: NewOrderCoordinator?
    var menuCoordinator: MenuCoordinator?

    private var shadowedView: UIView?

    func configure<T>(_ value: T, using closure: (inout T) throws -> Void) rethrows -> T {
        var value = value
        try closure(&value)
        return value
    }

    private lazy var tabBarViewController = configure(CustomTabBarController()) { tabBarController in
        configureAppearance(for: tabBarController as UITabBarController)
        configureShadow(for: tabBarController as UITabBarController)

        let ordersCoordinator = makeOrdersCoordinator
        ordersCoordinator.tabBarCoordinator = self
        self.ordersCoordinator = ordersCoordinator
        addChild(ordersCoordinator)

        let newOrderCoordinator = makeNewOrderCoordinator
        self.newOrderCoordinator = newOrderCoordinator
        addChild(newOrderCoordinator)
        
        let menuCoordinator = makeMenuCoordinator
        self.menuCoordinator = menuCoordinator
        addChild(menuCoordinator)

        tabBarController.viewControllers = [
            ordersCoordinator.toPresent,
            newOrderCoordinator.toPresent,
            menuCoordinator.toPresent
        ]

        ordersCoordinator.start()
        newOrderCoordinator.start()
        menuCoordinator.start()
    }
    
    private var makeOrdersCoordinator: OrdersCoordinator {
        let ordersCoordinator = OrdersCoordinator(router: RouterImpl())
        return ordersCoordinator
    }
    
    private var makeNewOrderCoordinator: NewOrderCoordinator {
        let newOrderCoordinator = NewOrderCoordinator(router: RouterImpl())
        return newOrderCoordinator
    }
    
    private var makeMenuCoordinator: MenuCoordinator {
        let menuCoordinator = MenuCoordinator(router: RouterImpl())
        return menuCoordinator
    }

    override var toPresent: UIViewController {
        tabBarViewController
    }

    override init(router: Router) {
        super.init(router: router)
    }

    private func configureAppearance(for tabBarController: UITabBarController) {
        if #available(iOS 15.0, *) {
            updateTabBarAppearance(for: tabBarController)
        }
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.layer.cornerRadius = 30
        tabBarController.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBarController.tabBar.tintColor = .colorLightBlue
        tabBarController.tabBar.unselectedItemTintColor = .colorDarkGray
    }

    @available(iOS 15.0, *)
    private func updateTabBarAppearance(for tabBarController: UITabBarController) {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .clear

        updateTabBarItemAppearance(appearance: tabBarAppearance.compactInlineLayoutAppearance)
        updateTabBarItemAppearance(appearance: tabBarAppearance.inlineLayoutAppearance)
        updateTabBarItemAppearance(appearance: tabBarAppearance.stackedLayoutAppearance)

        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    @available(iOS 13.0, *)
    private func updateTabBarItemAppearance(appearance: UITabBarItemAppearance) {
        let tintColor: UIColor = .colorLightBlue
        let unselectedItemTintColor: UIColor = .colorDarkGray

        appearance.selected.iconColor = tintColor
        appearance.normal.iconColor = unselectedItemTintColor
    }

    private func configureShadow(for tabBarController: UITabBarController) {
        shadowedView = UIView(frame: .zero)
        guard let shadowedView = shadowedView else { return }
        shadowedView.frame = tabBarController.tabBar.frame
        shadowedView.backgroundColor = .white
        shadowedView.layer.cornerRadius = 30
        shadowedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        shadowedView.layer.masksToBounds = false
        shadowedView.layer.shadowColor = UIColor.black.cgColor
        shadowedView.layer.shadowOffset = CGSize(width: 0, height: -2)
        shadowedView.layer.shadowOpacity = 0.8
        shadowedView.layer.shadowRadius = 20

        tabBarController.view.addSubview(shadowedView)
        tabBarController.view.bringSubviewToFront(tabBarController.tabBar)
    }

    func hideShadowView() {
        shadowedView?.isHidden = true
    }

    func showShadowView() {
        shadowedView?.isHidden = false
    }
}

final class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
