//
//  SceneDelegate.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 4/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = UINavigationController(rootViewController: AuthViewController(viewModel: AuthViewModel()))
        window?.makeKeyAndVisible()
    }
}

