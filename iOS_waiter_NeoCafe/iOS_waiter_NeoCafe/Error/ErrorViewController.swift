//
//  ErrorViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 31/03/24.
//

import UIKit

class ErrorViewController: UIViewController {
    
    var viewModel: ErrorViewModelProtocol
    let contentView = ErrorView()
    
    init(viewModel: ErrorViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func setupTargets() {
        contentView.updateButton.addTarget(self, action: #selector(updateButtonDidPress), for: .touchUpInside)
    }
    
    @objc func updateButtonDidPress() {
        viewModel.onNavigate?()
    }
    
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct ErrorViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        ErrorViewController(viewModel: ErrorViewModel()).showPreview()
//    }
//}
//#endif
