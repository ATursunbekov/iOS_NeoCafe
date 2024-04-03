//
//  BranchDetailViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 29/2/24.
//

import UIKit

class BranchDetailViewController: UIViewController {
    
    lazy var branchView = BranchDetailView()
    var viewModel: BranchDetailViewModelProtocol?
    
    init(viewModel: BranchDetailViewModelProtocol, response: BranchResponses) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.branchView.adressName.text = response.name
        self.branchView.dopAdressInfo.text = response.address
        self.branchView.infoDrop.setTime(time: getTimeAsString(response: response.workDays))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupDelegates()
        branchView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        branchView.menuButton.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        viewModel?.getPopular()
    }
    
    override func loadView() {
        view = branchView
    }
    
    func getTimeAsString(response: [WorkDays]) -> String {
        var res = ""
        for i in 0..<response.count {
            if i != response.count - 1 {
                res += "\(response[i].from) - \(response[i].to)\n"
            } else {
                res += "\(response[i].from) - \(response[i].to)"
            }
        }
        return res
    }
    
    func setupDelegates() {
        branchView.collectionView.delegate = self
        branchView.collectionView.dataSource = self
        branchView.menuCollectionView.delegate = self
        branchView.menuCollectionView.dataSource = self
        viewModel?.delegate = self
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func menuButtonPressed() {
        viewModel?.goToMenuScreen?()
    }
}

extension BranchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == branchView.collectionView {
            return 3
        } else {
            return viewModel?.popularProducts.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == branchView.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as! DetailCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            if let viewModel = viewModel {
                let temp = viewModel.popularProducts[indexPath.row]
                cell.configureData(name: temp.name, cost: temp.price, url: temp.url, product: temp)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == branchView.collectionView {
            return CGSize(width: UIScreen.main.bounds.width, height: 220)
        } else {
            return CGSize(width: 166, height: 207)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == branchView.menuCollectionView {
            if let viewModel = viewModel {
                let vc = DetailViewController(viewModel: DetailViewModel(productModel: viewModel.popularProducts[indexPath.row]))
                tabBarController?.tabBar.isHidden = true
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == branchView.collectionView {
            let currentPage = scrollView.contentOffset.x / scrollView.bounds.width
            branchView.pageController.currentPage = Int(currentPage)
        }
    }
}

extension BranchDetailViewController: BranchDetailViewModelDelegate {
    func getPopularResponse() {
        branchView.menuCollectionView.reloadData()
    }
}
