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
    
    func dismissModule(animated: Bool)
    
    func popModule(animated: Bool)
    
    func setRootModule(_ module: Presentable, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
    func popToModule(_ module: Presentable)
    
    func showAlert(withTitle title: String, message: String, buttonName: String)
    
    func showPopup(_ module: Presentable, animated: Bool)
    
}

final class RouterImpl: NSObject, Router, UINavigationControllerDelegate, UIAdaptivePresentationControllerDelegate {
    
    /// This method is intended to display an alert view with the specified title, message, and button name.
    func showAlert(withTitle title: String, message: String, buttonName: String) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonName, style: .default, handler: nil)
        alertController.addAction(action)
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    var navigationController: UINavigationController
    var completions: [UIViewController: EmptyCompletion]
    
    /// This initializer method initializes the RouterImpl instance with a UINavigationController. It also sets the delegate of the navigation controller to self (the router itself).
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
    
    /// This method is used to push a view controller onto the navigation stack. It allows for specifying parameters such as whether to animate the transition, whether to hide the bottom bar, whether to hide the navigation bar, and an optional completion closure to be executed after the transition.
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
    
    /// This method is used to pop (remove) the top view controller from the navigation stack. It also executes the completion closure associated with the popped view controller.
    func popModule(animated: Bool) {
        if let viewController = navigationController.popViewController(animated: animated) {
            runCompletion(for: viewController)
        }
    }
    
    func present(_ module: Presentable) {
        present(module, animated: true)
    }
    
    /// This method presents a view controller modally using the navigation controller's present(_:animated:completion:) method.
    func present(_ module: Presentable, animated: Bool) {
        navigationController.present(module.toPresent, animated: animated, completion: nil)
    }
    
    /// This method dismisses the currently presented view controller if it was presented modally. It also allows for specifying whether the dismissal should be animated and provides a completion closure to be executed after the dismissal.
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func dismissModule(animated: Bool) {
        navigationController.dismiss(animated: animated, completion: nil)
    }
    
    /// This method sets the root view controller of the navigation stack. It clears any existing view controllers, sets the specified view controller as the root, and optionally hides the navigation bar.
    func setRootModule(_ module: Presentable, hideBar: Bool) {
        completions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresent], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    /// This method pops all the view controllers on the navigation stack except for the root view controller. It also executes the completion closures associated with the popped view controllers.
    func popToRootModule(animated: Bool) {
        if let viewControllers = navigationController.popToRootViewController(animated: animated) {
            viewControllers.forEach { runCompletion(for: $0) }
        }
    }
    
    /// This method pops view controllers from the navigation stack until the specified view controller is at the top. It also executes the completion closures associated with the popped view controllers.
    func popToModule(_ module: Presentable) {
        if let viewControllers = navigationController.popToViewController(module.toPresent, animated: true) {
            viewControllers.forEach { runCompletion(for: $0) }
        }
    }
    
    /// This property returns the underlying UINavigationController instance, which allows the router to be presented or pushed onto another navigation stack.
    var toPresent: UIViewController {
        navigationController
    }
    
    /// This private method executes the completion closure associated with a given view controller and removes it from the completions dictionary.
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    /// This method is a delegate method of UINavigationControllerDelegate protocol, called when the navigation controller finishes showing a view controller. It ensures that the completion closure associated with any popped view controller is executed.
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

extension RouterImpl {
  func showPopup(_ module: Presentable, animated: Bool = true) {
    let controller = module.toPresent
    controller.modalPresentationStyle = .overCurrentContext // Adjust as needed (e.g., .custom)
    controller.modalTransitionStyle = .crossDissolve // Adjust as needed
    navigationController.present(controller, animated: animated, completion: nil)
  }
}
