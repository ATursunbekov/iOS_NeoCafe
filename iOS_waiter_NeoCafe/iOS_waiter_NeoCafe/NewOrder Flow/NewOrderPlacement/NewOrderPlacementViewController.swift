//
//  NewOrderPlacementViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

final class NewOrderPlacementViewController: UIViewController {
    
    var viewModel: NewOrderPlacementViewModelProtocol
    let contentView = NewOrderPlacementView()

    init(viewModel: NewOrderPlacementViewModelProtocol) {
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
        tabBarController?.tabBar.isHidden = true
    }
    
    func setupTargets() {
        contentView.backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
        contentView.nextButton.addTarget(self, action: #selector(nextButtonDidPress), for: .touchUpInside)
    }
    
    @objc func nextButtonDidPress() {
        viewModel.onNewOrderNavigate?()
    }
    
    @objc func backButtonDidPress() {
        viewModel.onNewOrderNavigate?()
    }
}