//
//  CustomTabBar.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 20/2/24.
//
import UIKit
import SwiftUI

//class CustomTabBarController: UITabBarController {
//
//    enum TabBarItem: String, CaseIterable {
//        case home = "Главная"
//        case basket = "Корзина"
//        case branch = "Филиалы"
//        case profile = "Профиль"
//        
//        var image: UIImage? {
//            switch self {
//            case .home: return UIImage(named: Asset.home.name)
//            case .basket: return UIImage(named: Asset.basket.name)
//            case .branch: return UIImage(named: Asset.branch.name)
//            case .profile: return UIImage(named: Asset.profile.name)
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationController?.navigationBar.isUserInteractionEnabled = false
//        tabBar.barStyle = .default
//        tabBar.isTranslucent = true
//        tabBar.backgroundImage = UIImage()
//        setupConstraints()
//        setupTabBar()
//        tabBar.tintColor = Asset.colorOrange.color
//    }
//
//    lazy var customView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 40
//        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: -3)
//        view.layer.shadowOpacity = 0.1
//        view.layer.shadowRadius = 4
//        return view
//    }()
//
//    func setupConstraints() {
//        tabBar.addSubview(customView)
//
//        customView.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//            make.top.equalToSuperview()
//            make.bottom.equalTo(view.snp.bottom)
//        }
//    }
//
//    private func setupTabBar() {
//        let placeholder = UIViewController()
//        placeholder.tabBarItem.isEnabled = false
//        viewControllers = TabBarItem.allCases.map { item in
//            generateVC(
//                viewController: getViewController(for: item),
//                title: item.rawValue,
//                image: item.image
//            )
//        }
//    }
//
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
//        viewController.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
//        return viewController
//    }
//
//    private func getViewController(for tab: TabBarItem) -> UINavigationController {
//        switch tab {
//        case .home:
//            return UINavigationController(rootViewController: MainViewController(viewModel: MainViewModel()))
//        case .basket:
//            return UINavigationController(rootViewController: BasketViewController())
//        case .branch:
//            return UINavigationController(rootViewController: BranchViewController())
//        case .profile:
//            return UINavigationController(rootViewController: ProfileViewController())
//        }
//    }
//}
//
////#if DEBUG
////
////@available(iOS 13.0, *)
////struct CustomTabBarControllerPreview: PreviewProvider {
////    static var previews: some View {
////        CustomTabBarController().showPreview()
////    }
////}
////#endif
