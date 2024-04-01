//
//  SuccessfulClosingModal.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 24/03/24.
//

import UIKit
import SnapKit

class SuccessfulClosingModalViewController: UIViewController {
    
    // TODO: - Set a delay after successful closing and before moving to Tables screen
    
    // MARK: First popup
    lazy var modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "checkmarkGreen")
        view.image = image
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ успешно закрыт"
        label.textAlignment = .center
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        setupConstraints()
        hideModalView()
    }
    
    func setupConstraints() {
        view.addSubview(modalView)
        modalView.addSubview(imageView)
        modalView.addSubview(titleLabel)
        
        modalView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(197)
            make.width.equalTo(343)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
    func hideModalView() {
        modalView.isHidden = true
    }
    
}


//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct SuccessfulClosingModalViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        SuccessfulClosingModalViewController().showPreview()
//    }
//}
//#endif
