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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        viewModel?.getPopular()
        mainView.collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isUserInteractionEnabled = false
        setupDelegates()
        setupTargets()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !DataManager.shared.showedBranches {
            showBranches()
            DataManager.shared.showedBranches.toggle()
        }
    }

    override func loadView() {
        view = mainView
    }

    func setupDelegates() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        viewModel?.delegate = self
    }

    func setupTargets() {
        mainView.bellButton.addTarget(self, action: #selector(showNotifivations), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarPressed))
        mainView.searchBar.addGestureRecognizer(tapGesture)
    }

    @objc func showNotifivations() {
        viewModel?.goToNotificationScreen?()
    }

    func showBranches() {
        let branchView = BranchView(viewModel: BranchViewModel())
        branchView.modalPresentationStyle = .overFullScreen
        present(branchView, animated: false)
    }

    @objc func goToMenuScreen() {
        viewModel?.goToMenuScreen?(0)
    }

    @objc func searchBarPressed() {
        viewModel?.goToSearchScreen?()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return viewModel?.popularProducts.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: MainCategoryCollectionViewCell = collectionView.dequeue(for: indexPath)
            guard let viewModel = viewModel else { return cell }
            cell.configureData(name: viewModel.mainCategory[indexPath.row].name, image: viewModel.mainCategory[indexPath.row].image)
            return cell
        } else {
            let cell: MainMenuCollectionViewCell = collectionView.dequeue(for: indexPath)
            let temp = viewModel?.popularProducts[indexPath.row]
            if let temp = temp {
                cell.configureData(name: temp.name, description: temp.description, cost: temp.price, url: temp.url, product: temp)
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainCategoryCollectionReusableView.identifier, for: indexPath) as! MainCategoryCollectionReusableView
            header.menuButton.addTarget(self, action: #selector(goToMenuScreen), for: .touchUpInside)
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopularCollectionReusableView.identifier, for: indexPath) as! PopularCollectionReusableView
            return header
        }
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            viewModel?.goToMenuScreen?(indexPath.row)
        } else {
            if let product = viewModel?.popularProducts[indexPath.row] {
                viewModel?.gotToProductDetailScreen?(product)
            }
        }
    }
}

extension MainViewController: MainViewModelDelegate {
    func getPopularResponse() {
        mainView.collectionView.reloadData()
    }
}
