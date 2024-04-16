//
//  CoffeeSupplementsDrawerViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 23/03/24.
//

import UIKit
import SnapKit

final class CoffeeSupplementsDrawerViewController: UIViewController {
    
    var viewModel: CoffeeSupplementsDrawerViewModelProtocol
    let contentView = CoffeeSupplementsDrawerView()
    
    private var tapAction: EmptyCompletion?
    
    init(viewModel: CoffeeSupplementsDrawerViewModelProtocol, tapAction: EmptyCompletion? = nil) {
        self.viewModel = viewModel
        self.tapAction = tapAction
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = contentView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupGestures()
        setupTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        contentView.backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    func setupTargets() {
        contentView.saveButton.addTarget(self, action: #selector(saveButtonDidPress), for: .touchUpInside)
    }
    
    @objc func saveButtonDidPress() {
        dismiss(animated: true)
        viewModel.dismissModule?()
        tapAction?()
    }
}
