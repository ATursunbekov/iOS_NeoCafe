//
//  InitialCoordinator.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import UIKit

final class InitializationCoordinator: BaseCoordinator {
    
    var onAuthenticationNavigate: EmptyCompletion?
    
    lazy var startController: UIViewController = {
        let vm = AuthViewModel()
        vm.onAuthNavigate = onAuthenticationNavigate
        let vc = AuthViewController(viewModel: vm)
        router.setRootModule(vc, hideBar: true)
        return vc
    }()
    
    override var toPresent: UIViewController {
        startController
    }
    
    deinit {
        onAuthenticationNavigate = nil
    }
}
