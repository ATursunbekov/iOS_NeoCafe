//
//  SceneDelegate.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 4/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    lazy var applicationCoordinator = ApplicationCoordinator()

    func scene(_: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light

        applicationCoordinator.start(nil)
    }
}
