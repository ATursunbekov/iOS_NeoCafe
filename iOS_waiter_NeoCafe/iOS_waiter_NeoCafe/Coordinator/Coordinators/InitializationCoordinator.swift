//
//  InitializationCoordinator.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
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
