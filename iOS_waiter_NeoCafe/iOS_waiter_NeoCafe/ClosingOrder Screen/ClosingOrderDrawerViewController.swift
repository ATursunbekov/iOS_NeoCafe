//
//  ClosingOrderDrawerViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

class ClosingOrderDrawerViewController: UIViewController {
    
    var viewModel: ClosingOrderDrawerViewModelProtocol
    
    private var tapAction: EmptyCompletion?
        
    init(viewModel: ClosingOrderDrawerViewModelProtocol, tapAction: EmptyCompletion? = nil) {
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
        label.text = "Закрытие счета"
        label.font = .poppins(size: 24, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createClosingOrderSection())
        
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(ClosingOrderCell.self, forCellWithReuseIdentifier: ClosingOrderCell.identifier)
        
        collectionView.register(ClosingOrderHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ClosingOrderHeader.identifier)
        
        collectionView.showsVerticalScrollIndicator = true
        return collectionView
    }()
    
    lazy var stackHorizontal = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        stack.addArrangedSubview(totalTextLabel)
        stack.addArrangedSubview(totalNumberLabel)
        return stack
    }()
    
    lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: "
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "... сом"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .poppins(size: 16, weight: .bold)
        label.textColor = .colorDarkBlue
        return label
    }()
    
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
        setupDelegates()
        setupTargets()
        setupConstraints()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        collectionView.reloadData()
    }
    
    func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupConstraints() {
        
        view.addSubview(backgroundView)
        view.addSubview(drawerView)
        drawerView.addSubview(headerTitle)
        drawerView.addSubview(collectionView)
        drawerView.addSubview(stackHorizontal)
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerTitle.snp.bottom).offset(24)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(200)
        }
        
        stackHorizontal.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(drawerView.snp.centerX)
            make.height.equalTo(22)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.height.height.equalTo(54)
        }
    }
}
    
// MARK: - Gestures
extension ClosingOrderDrawerViewController {
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    private func setupTargets() {
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc func saveButtonPressed() {
        dismiss(animated: false)
        tapAction?()
        viewModel.onSuccessfulClosingNavigate?()
    }
}

// MARK: - Collection view layout
extension ClosingOrderDrawerViewController {
    private func createClosingOrderSection() -> UICollectionViewCompositionalLayout {
       
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - Collection View methods
extension ClosingOrderDrawerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClosingOrderCell.identifier, for: indexPath) as! ClosingOrderCell
        let data = viewModel.items[indexPath.item]
        cell.configureCell(with: data)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: -
    }
}

extension ClosingOrderDrawerViewController: ClosingOrderCellDelegate {
    func getTotal() {
        let totalPrice = viewModel.totalPriceValue
        totalNumberLabel.text = "\(totalPrice)"
    }
}

//#if DEBUG
//import SwiftUI
//@available(iOS 13.0, *)
//struct ClosingOrderDrawerViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        ClosingOrderDrawerViewController().showPreview()
//    }
//}
//#endif
