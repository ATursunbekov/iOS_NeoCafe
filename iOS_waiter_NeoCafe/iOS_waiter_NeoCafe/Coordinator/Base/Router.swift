//
//  Router.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import UIKit
import Combine

protocol Router: AnyObject, Presentable {
    
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    
    func push(_ module: Presentable)
    func push(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, hideBottomBar: Bool)
    func push(_ module: Presentable, animated: Bool, hideBottomBar: Bool, hideNavBar: Bool, completion: EmptyCompletion?)
    func push(_ module: Presentable, animated: Bool, completion: EmptyCompletion?)
    
    func present(_ module: Presentable, animated: Bool)
    func present(_ module: Presentable)
    
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func popModule(animated: Bool)
    
    func setRootModule(_ module: Presentable, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
    func popToModule(_ module: Presentable)
    
    func showAlert(withTitle title: String, message: String, buttonName: String)
}

final class RouterImpl: NSObject, Router, UINavigationControllerDelegate, UIAdaptivePresentationControllerDelegate {
    func showAlert(withTitle title: String, message: String, buttonName: String) {
        
    }
    
    
    var navigationController: UINavigationController
    var completions: [UIViewController: EmptyCompletion]
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        self.navigationController.delegate = self
    }
    
    var rootViewController: UIViewController? {
        navigationController.viewControllers.first
    }
    
    func push(_ module: Presentable) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable, animated: Bool) {
        push(module, animated: animated, hideBottomBar: false, completion: nil)
    }
    
    func push(_ module: Presentable, hideBottomBar: Bool) {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
    
    func push(_ module: Presentable, animated: Bool, completion: EmptyCompletion?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }
    
    func push(_ module: Presentable, animated: Bool, hideBottomBar: Bool, hideNavBar: Bool = false,
              completion: EmptyCompletion?) {
        let controller = module.toPresent
        controller.hidesBottomBarWhenPushed = hideBottomBar
        
        if controller is UINavigationController {
            preconditionFailure("Can't present UINavigationController")
        }
        
        module.toPresent.hidesBottomBarWhenPushed = hideBottomBar
        navigationController.isNavigationBarHidden = hideNavBar
        navigationController.pushViewController(module.toPresent, animated: animated)
        if let completion = completion {
            completions[module.toPresent] = completion
        }
    }
    
    func popModule(animated: Bool) {
        if let viewController = navigationController.popViewController(animated: animated) {
            runCompletion(for: viewController)
        }
    }
    
    func present(_ module: Presentable) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable, animated: Bool) {
        navigationController.present(module.toPresent, animated: animated, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable, hideBar: Bool) {
        completions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresent], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let viewControllers = navigationController.popToRootViewController(animated: animated) {
            viewControllers.forEach { runCompletion(for: $0) }
        }
    }
    
    func popToModule(_ module: Presentable) {
        if let viewControllers = navigationController.popToViewController(module.toPresent, animated: true) {
            viewControllers.forEach { runCompletion(for: $0) }
        }
    }
    
    var toPresent: UIViewController {
        navigationController
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool) {
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(poppedViewController) else {
            return
        }
        runCompletion(for: poppedViewController)
    }
}
