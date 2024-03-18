//
//  IngredientViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/2/24.
//

import UIKit
import SwiftUI

class IngredientViewController: UIViewController {
    
    var chooseMilk = 0
    var chooseSirop = 0
    private var tapAction: (() -> Void)?
    
    init(tapAction: ( () -> Void)? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.tapAction = tapAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.colorWhite.color
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var beanImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Asset.ingredientsImage.name))
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var milkTitle: UILabel = {
        let label = UILabel()
        label.text = Str.milkTitle
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var circleButton1 = CircleButton(text: "Коровье молоко", index: 0, delegate: self)
    lazy var circleButton2 = CircleButton(text: "Овсяное молоко", index: 0, delegate: self)
    lazy var circleButton3 = CircleButton(text: "Соевое молоко", index: 0, delegate: self)
    
    lazy var syrupTitle: UILabel = {
        let label = UILabel()
        label.text = Str.syrup
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = Asset.colorDarkBlue.color
        return label
    }()
    
    lazy var rectengularButton1 = RectengularButton(text: "Клубничный", index: 0, delegte: self)
    lazy var rectengularButton2 = RectengularButton(text: "Карамельный", index: 1, delegte: self)
    
    lazy var basketButton: UIButton = {
        let button = UIButton()
        button.setTitle(Str.basketButton, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = Asset.colorDarkBlue.color
        button.titleLabel?.font = .poppins(size: 16, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backView.addGestureRecognizer(tapGesture)
        basketButton.addTarget(self, action: #selector(addToBasketPressed), for: .touchUpInside)
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(backView)
        view.addSubview(popUpView)
        popUpView.addSubview(beanImage)
        popUpView.addSubview(milkTitle)
        popUpView.addSubview(circleButton1)
        popUpView.addSubview(circleButton2)
        popUpView.addSubview(circleButton3)
        popUpView.addSubview(syrupTitle)
        popUpView.addSubview(rectengularButton1)
        popUpView.addSubview(rectengularButton2)
        popUpView.addSubview(basketButton)
        
        popUpView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(378)
        }
        
        backView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(popUpView.snp.top).offset(10)
        }
        
        beanImage.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
        }
        
        milkTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(32)
        }
        
        circleButton1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(milkTitle.snp.bottom).offset(16)
            make.trailing.equalTo(circleButton1.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        circleButton2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(circleButton1.snp.bottom).offset(12)
            make.trailing.equalTo(circleButton2.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        circleButton3.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(circleButton2.snp.bottom).offset(12)
            make.trailing.equalTo(circleButton3.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        syrupTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(circleButton3.snp.bottom).offset(24)
        }
        
        rectengularButton1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(syrupTitle.snp.bottom).offset(16)
            make.trailing.equalTo(rectengularButton1.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        rectengularButton2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(rectengularButton1.snp.bottom).offset(16)
            make.trailing.equalTo(rectengularButton1.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        basketButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    @objc func addToBasketPressed() {
        dismiss(animated: false)
        tapAction?()
    }
        
}

extension IngredientViewController: CircleButtonDelegate {
    func chooseOption(index: Int) {
        circleButton1.innerView.isHidden = true
        circleButton2.innerView.isHidden = true
        circleButton3.innerView.isHidden = true
        circleButton1.circleView.backgroundColor = Asset.colorGray.color
        circleButton2.circleView.backgroundColor = Asset.colorGray.color
        circleButton3.circleView.backgroundColor = Asset.colorGray.color
        chooseMilk = index
    }
}

extension IngredientViewController: RectengularButtonDelegate {
    func chooseRectengularOption(index: Int) {
        rectengularButton1.innerImage.isHidden = true
        rectengularButton2.innerImage.isHidden = true
        chooseSirop = index
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct IngredientViewControllerPreview: PreviewProvider {
    static var previews: some View {
        IngredientViewController().showPreview()
    }
}
#endif
