//
//  NewOrderCoffeeSupplementsDrawerView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 28/03/24.
//

import UIKit
import SnapKit

class NewOrderCoffeeSupplementsDrawerView: UIViewController {
    
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
    
    lazy var drawerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorWhite
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Латте"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var milkTitle: UILabel = {
        let label = UILabel()
        label.text = "Молоко"
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
    
    
    lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.textAlignment = .left
        label.font = .poppins(size: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "... сум"
        label.textAlignment = .left
        label.font = .poppins(size: 16, weight: .semibold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var productCounter = RectangularCounter()
    
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
        view.addSubview(drawerView)
        drawerView.addSubview(headerTitle)
        drawerView.addSubview(milkTitle)
        drawerView.addSubview(circleButton1)
        drawerView.addSubview(circleButton2)
        drawerView.addSubview(circleButton3)
        drawerView.addSubview(syrupTitle)
        drawerView.addSubview(rectengularButton1)
        drawerView.addSubview(rectengularButton2)
        drawerView.addSubview(totalTextLabel)
        drawerView.addSubview(totalNumberLabel)
        drawerView.addSubview(productCounter)
        drawerView.addSubview(saveButton)
        
        drawerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(514)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.height.equalTo(29)
        }
        
        milkTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(headerTitle.snp.bottom).offset(15)
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
        
        totalTextLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(productCounter.snp.top).offset(16)
            make.height.equalTo(19)
        }
        
        totalNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(totalTextLabel.snp.top)
            make.leading.equalTo(totalTextLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
        
        productCounter.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(saveButton.snp.top).offset(16)
            make.width.equalTo(99)
            make.height.equalTo(44)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
    }
}

extension NewOrderCoffeeSupplementsDrawerView: CircleButtonDelegate {
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

extension NewOrderCoffeeSupplementsDrawerView: RectangularButtonDelegate {
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
