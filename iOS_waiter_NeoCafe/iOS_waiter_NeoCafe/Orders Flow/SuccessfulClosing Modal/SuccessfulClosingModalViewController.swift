//
//  SuccessfulClosingModalViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 24/03/24.
//

import UIKit
import SnapKit

final class SuccessfulClosingModalViewController: UIViewController {
    
    var viewModel: SuccessfulClosingModalViewModelProtocol
    let contentView = SuccessfulClosingModalView()
        
    init(viewModel: SuccessfulClosingModalViewModelProtocol) {
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
        hideModalViewWithDelay()
    }

    func hideModalViewWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.contentView.modalView.isHidden = true
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
            self?.viewModel.onOrdersNavigate?()
        }
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct SuccessfulClosingModalViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        SuccessfulClosingModalViewController(viewModel: SuccessfulClosingModalViewModel()).showPreview()
//    }
//}
//#endif
