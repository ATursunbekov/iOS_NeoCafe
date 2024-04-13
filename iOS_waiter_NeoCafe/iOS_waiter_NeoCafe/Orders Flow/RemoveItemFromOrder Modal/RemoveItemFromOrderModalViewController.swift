//
//  RemoveItemModalView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

final class RemoveItemFromOrderModalViewController: UIViewController {
        
    var viewModel: RemoveItemFromOrderModalViewModelProtocol
    let contentView = RemoveItemFromOrderModalView()
    
    init(viewModel: RemoveItemFromOrderModalViewModelProtocol) {
        self.viewModel = viewModel
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
        hideModalView()
        setupTargets()
    }
    
    func hideModalView() {
        contentView.modalView.isHidden = false
    }
    
    func setupTargets() {
        contentView.yesButton.addTarget(self, action: #selector(yesButtonDidTap), for: .touchUpInside)
        contentView.noButton.addTarget(self, action: #selector(noButtonDidTap), for: .touchUpInside)
    }
    
    @objc func yesButtonDidTap() {
        viewModel.removeSelectedItemFromOrder()
        viewModel.onOrderDetailsNavigate?(viewModel.order)
        dismiss(animated: true)
    }
    
    @objc func noButtonDidTap() {
        viewModel.popScreen?()
        dismiss(animated: true)
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct RemoveItemFromOrderModalViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        RemoveItemFromOrderModalViewController(viewModel: RemoveItemFromOrderModalViewModel()).showPreview()
//    }
//}
//#endif
