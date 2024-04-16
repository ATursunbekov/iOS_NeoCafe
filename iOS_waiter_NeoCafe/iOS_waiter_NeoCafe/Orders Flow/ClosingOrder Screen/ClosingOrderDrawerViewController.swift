//
//  ClosingOrderDrawerViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 22/03/24.
//

import UIKit
import SnapKit

final class ClosingOrderDrawerViewController: UIViewController {
    
    var viewModel: ClosingOrderDrawerViewModelProtocol
    let contentView = ClosingOrderDrawerView()
    
    private var tapAction: EmptyCompletion?
        
    init(viewModel: ClosingOrderDrawerViewModelProtocol, tapAction: EmptyCompletion? = nil) {
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
        setupGestures()
        setupDelegates()
        setupTargets()
        navigationController?.navigationBar.isHidden = true
        
        // Use the layout created by the view
        contentView.collectionView.collectionViewLayout = contentView.createLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        contentView.collectionView.reloadData()
        getTotal()
    }
    
    func setupDelegates() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
}
    
// MARK: - Gestures
extension ClosingOrderDrawerViewController {
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        contentView.backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false)
    }
    
    private func setupTargets() {
        contentView.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc func saveButtonPressed() {
        dismiss(animated: false)
        tapAction?()
        viewModel.onSuccessfulClosingNavigate?()
    }
}

// MARK: - Collection View methods
extension ClosingOrderDrawerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getItemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ClosingOrderCell = collectionView.dequeue(for: indexPath)
        
        let data = viewModel.items[indexPath.item]
        cell.configureCell(with: data)
        cell.delegate = self
        return cell
    }
}

extension ClosingOrderDrawerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            let headerView: ClosingOrderHeader = collectionView.dequeue(for: indexPath, kind: kind)
            return headerView
        default:
            fatalError("Unexpected element kind")
        }
    }
}

extension ClosingOrderDrawerViewController: ClosingOrderCellDelegate {
    func getTotal() {
        let totalPrice = viewModel.totalPriceValue
        contentView.totalNumberLabel.text = "\(totalPrice) сом"
    }
}
