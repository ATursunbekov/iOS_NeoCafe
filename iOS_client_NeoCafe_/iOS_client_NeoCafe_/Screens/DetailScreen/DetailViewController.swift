//
//  DetailViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 24/2/24.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupDelegate()
        setupTargets()
    }
    
    override func loadView() {
        view = detailView
    }
    
    func setupDelegate() {
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
    }
    
    func setupTargets() {
        detailView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        detailView.basketButton.addTarget(self, action: #selector(addToBasketPressed), for: .touchUpInside)
    }
    
    @objc func backPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func addToBasketPressed() {
        let vc = IngredientViewController {
            self.navigationController?.popToRootViewController(animated: true)
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
