//
//  TabBarCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {
    var mainCoordinator: MainCoordinator?
    var basketCoordinator: BasketCoordinator?
    var branchCoordinator: BranchCoordinator?
    var profileCoordinator: ProfileCoordinator?
    var onSearch: EmptyCompletion?
    var onProductDetail: EmptyCompletion?

    private var shadowedView: UIView?

    func configure<T>(_ value: T, using closure: (inout T) throws -> Void) rethrows -> T {
        var value = value
        try closure(&value)
        return value
    }

    private lazy var tabBarViewController = configure(CustomTabBarController()) { tabBarController in
        configureAppearance(for: tabBarController)
        configureShadow(for: tabBarController)

        let mainCoordinator = makeMainCoordinator
        mainCoordinator.tabBarCoordinator = self
        self.mainCoordinator = mainCoordinator
        addChild(mainCoordinator)

        let basketCoordinator = makeBasketCoordinator
        self.basketCoordinator = basketCoordinator
        addChild(basketCoordinator)

        let branchCoordinator = makeBranchCoordinator
        self.branchCoordinator = branchCoordinator
        addChild(branchCoordinator)

        let profileCoordinator = makeProfileCoordinator
        self.profileCoordinator = profileCoordinator
        addChild(profileCoordinator)

        tabBarController.viewControllers = [
            mainCoordinator.toPresent,
            basketCoordinator.toPresent,
            branchCoordinator.toPresent,
            profileCoordinator.toPresent,
        ]

        mainCoordinator.start()
        basketCoordinator.start()
        branchCoordinator.start()
        profileCoordinator.start()
    }

    private var makeMainCoordinator: MainCoordinator {
        let mainCoordinator = MainCoordinator(router: RouterImpl())
        return mainCoordinator
    }

    private var makeBasketCoordinator: BasketCoordinator {
        let orderCoordinator = BasketCoordinator(router: RouterImpl())
        return orderCoordinator
    }

    private var makeBranchCoordinator: BranchCoordinator {
        let branchCoordinator = BranchCoordinator(router: RouterImpl())
        return branchCoordinator
    }

    private var makeProfileCoordinator: ProfileCoordinator {
        let profileCoordinator = ProfileCoordinator(router: RouterImpl())
        return profileCoordinator
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
        tabBarController.tabBar.tintColor = Asset.colorOrange.color
        tabBarController.tabBar.unselectedItemTintColor = Asset.colorDarkGray.color
    }

    @available(iOS 15.0, *)
    private func updateTabBarAppearance(for tabBarController: UITabBarController) {
        let tabBarAppearance = UITabBarAppearance()
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
        let tintColor: UIColor = Asset.colorOrange.color
        let unselectedItemTintColor: UIColor = Asset.colorDarkGray.color

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
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func tabBarController(_: UITabBarController,
                          shouldSelect _: UIViewController) -> Bool
    {
        return true
    }
}

private extension TabBarCoordinator {
    static var mainTabIndex: Int {
        return 0
    }

    static var orderTabIndex: Int {
        return 1
    }

    static var branchTabIndex: Int {
        return 2
    }

    static var profileTabIndex: Int {
        return 3
    }
}
