//
//  RectangularButton.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 23/03/24.
//

import UIKit
import SnapKit

protocol RectangularButtonDelegate: AnyObject {
    func chooseRectengularOption(index: Int)
}

class RectengularButton: UIView {
    
    var index = 0
    weak var delegate: RectangularButtonDelegate?
    
    lazy var rectengularView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.colorSecondDarkBlue.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var innerImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "checkMark"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .poppins(size: 16, weight: .regular)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    required init(text: String, index: Int, delegte: RectangularButtonDelegate) {
        super.init(frame: .zero)
        self.delegate = delegte
        self.index = index
        titleLabel.text = text
        setupConstraints()
        setupGestureDetector()
    }
    
    func setupConstraints() {
        addSubview(rectengularView)
        rectengularView.addSubview(innerImage)
        addSubview(titleLabel)
        
        rectengularView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(20)
        }
        
        innerImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(9.5)
            make.width.equalTo(11)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(rectengularView.snp.trailing).offset(8)
        }
        
        innerImage.isHidden = true
    }
    
    func setupGestureDetector() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        rectengularView.addGestureRecognizer(tapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        rectengularView.addGestureRecognizer(doubleTapGesture)
        
        tapGesture.require(toFail: doubleTapGesture)
    }

    @objc func handleSingleTap(_ sender: UITapGestureRecognizer) {
        delegate?.chooseRectengularOption(index: index)
        innerImage.isHidden = false
        rectengularView.layer.borderColor = UIColor.colorSecondDarkBlue.cgColor
    }
    
    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        innerImage.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct CoffeeSupplementsDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        CoffeeSupplementsDrawerViewController().showPreview()
//    }
//}
//#endif
