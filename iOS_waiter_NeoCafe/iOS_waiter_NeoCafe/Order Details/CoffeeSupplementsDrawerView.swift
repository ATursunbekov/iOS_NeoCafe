//
//  CoffeeSupplementsDrawerView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 23/03/24.
//

import UIKit
import SnapKit

class CoffeeSupplementsDrawerViewController: UIViewController {
    
    var isCoffeeCategory: Bool = true
    
    var chooseMilk = 0
    var chooseSyrup = 0
    private var tapAction: (() -> Void)?
    
    init(tapAction: ( () -> Void)? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.tapAction = tapAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var milkTitle: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var circleButton1 = CircleButton(text: "Коровье молоко", index: 0, delegate: self)
    lazy var circleButton2 = CircleButton(text: "Овсяное молоко", index: 0, delegate: self)
    lazy var circleButton3 = CircleButton(text: "Соевое молоко", index: 0, delegate: self)
    
    lazy var syrupTitle: UILabel = {
        let label = UILabel()
        label.text = "Сироп"
        label.font = .poppins(size: 20, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var rectengularButton1 = RectengularButton(text: "Клубничный", index: 0, delegte: self)
    lazy var rectengularButton2 = RectengularButton(text: "Карамельный", index: 1, delegte: self)
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .colorLightBlue
        button.titleLabel?.font = .poppins(size: 16, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        setupTargets()
        setupConstraints()
    }

    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    func setupTargets() {
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc func saveButtonPressed() {
        dismiss(animated: false)
        tapAction?()
    }
    
    func setupConstraints() {
        view.addSubview(backgroundView)
        view.addSubview(popUpView)
        popUpView.addSubview(milkTitle)
        popUpView.addSubview(circleButton1)
        popUpView.addSubview(circleButton2)
        popUpView.addSubview(circleButton3)
        popUpView.addSubview(syrupTitle)
        popUpView.addSubview(rectengularButton1)
        popUpView.addSubview(rectengularButton2)
        popUpView.addSubview(saveButton)
        
        popUpView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(378)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(popUpView.snp.top).offset(10)
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
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
    }
}

extension CoffeeSupplementsDrawerViewController: CircleButtonDelegate {
    func chooseOption(index: Int) {
        circleButton1.innerView.isHidden = true
        circleButton2.innerView.isHidden = true
        circleButton3.innerView.isHidden = true
        circleButton1.circleView.backgroundColor = .colorGray
        circleButton2.circleView.backgroundColor = .colorGray
        circleButton3.circleView.backgroundColor = .colorGray
        chooseMilk = index
    }
}

extension CoffeeSupplementsDrawerViewController: RectangularButtonDelegate {
    func chooseRectengularOption(index: Int) {
        rectengularButton1.innerImage.isHidden = true
        rectengularButton2.innerImage.isHidden = true
        chooseSyrup = index
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
