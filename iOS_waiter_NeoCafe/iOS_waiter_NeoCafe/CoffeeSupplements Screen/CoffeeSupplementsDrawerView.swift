//
//  CoffeeSupplementsDrawerView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 23/03/24.
//

import UIKit
import SnapKit

class CoffeeSupplementsDrawerViewController: UIViewController {
    
    var viewModel: CoffeeSupplementsDrawerViewModelProtocol
    private var tapAction: EmptyCompletion?
    
    var milkIndex = 0
    var syrupIndex = 0
    
    init(viewModel: CoffeeSupplementsDrawerViewModelProtocol, tapAction: EmptyCompletion? = nil) {
        self.viewModel = viewModel
        self.tapAction = tapAction
        super.init(nibName: nil, bundle: nil)
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
    
    lazy var rectangularButton1 = RectangularButton(text: "Клубничный", index: 0, delegte: self)
    lazy var rectangularButton2 = RectangularButton(text: "Карамельный", index: 1, delegte: self)
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    func setupTargets() {
        saveButton.addTarget(self, action: #selector(saveButtonDidPress), for: .touchUpInside)
    }
    
    @objc func saveButtonDidPress() {
        dismiss(animated: false)
        tapAction?()
        viewModel.popScreen?()
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
        drawerView.addSubview(rectangularButton1)
        drawerView.addSubview(rectangularButton2)
        drawerView.addSubview(saveButton)
        
        drawerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(419)
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
        
        rectangularButton1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(syrupTitle.snp.bottom).offset(16)
            make.trailing.equalTo(rectangularButton1.titleLabel.snp.trailing)
            make.height.equalTo(20)
        }
        
        rectangularButton2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(rectangularButton1.snp.bottom).offset(16)
            make.trailing.equalTo(rectangularButton1.titleLabel.snp.trailing)
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
        milkIndex = index
    }
}

extension CoffeeSupplementsDrawerViewController: RectangularButtonDelegate {
    func chooseRectangularOption(index: Int) {
        rectangularButton1.innerImage.isHidden = true
        rectangularButton2.innerImage.isHidden = true
        syrupIndex = index
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
