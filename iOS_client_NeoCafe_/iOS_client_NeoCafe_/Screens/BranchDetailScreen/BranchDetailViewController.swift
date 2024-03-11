//
//  BranchDetailViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 29/2/24.
//

import UIKit

class BranchDetailViewController: UIViewController {
    
    lazy var branchView = BranchDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupDelegates()
        branchView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        view = branchView
    }
    
    func setupDelegates() {
        branchView.collectionView.delegate = self
        branchView.collectionView.dataSource = self
        branchView.menuCollectionView.delegate = self
        branchView.menuCollectionView.dataSource = self
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension BranchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == branchView.collectionView {
            return 3
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == branchView.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as! DetailCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == branchView.collectionView {
            return CGSize(width: UIScreen.main.bounds.width, height: 220)
        } else {
            return CGSize(width: 141, height: 207)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == branchView.menuCollectionView {
//            let vc = DetailViewController()
//            tabBarController?.tabBar.isHidden = true
//            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == branchView.collectionView {
            let currentPage = scrollView.contentOffset.x / scrollView.bounds.width
            branchView.pageController.currentPage = Int(currentPage)
        }
    }
}
