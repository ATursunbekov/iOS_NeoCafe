//
//  SceneDelegate.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 4/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    lazy var applicationCoordinator = ApplicationCoordinator()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.overrideUserInterfaceStyle = .light
        
        applicationCoordinator.start(nil)
    }
}

