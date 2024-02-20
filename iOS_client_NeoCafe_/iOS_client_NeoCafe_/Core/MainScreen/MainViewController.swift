//
//  MainViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 18/2/24.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var mainView = MainView()
    var viewModel: MainViewModelProtocol?
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }
    
    override func loadView() {
        view = mainView
    }
    
    func setupDelegates() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCollectionViewCell.identifier, for: indexPath) as! MainCategoryCollectionViewCell
            guard let viewModel = viewModel else { return cell }
            cell.configureData(name: viewModel.mainCategory[indexPath.row].name, image: viewModel.mainCategory[indexPath.row].image)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMenuCollectionViewCell.identifier, for: indexPath) as! MainMenuCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainCategoryCollectionReusableView.identifier, for: indexPath) as! MainCategoryCollectionReusableView
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopularCollectionReusableView.identifier, for: indexPath) as! PopularCollectionReusableView
            return header
        }
    }
}
