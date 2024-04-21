//
//  ProfileViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 3/4/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileView = ProfileView()
    var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupDelegates()
        viewModel.getProfileData()
        setupTarget()
    }
    
    override func loadView() {
        view = profileView
    }
    
    func setupDelegates() {
        profileView.collectionView.delegate = self
        profileView.collectionView.dataSource = self
        viewModel.delegate = self
    }
    
    func setupTarget() {
        profileView.logout.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        profileView.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc func goBack() {
        viewModel.goBack?()
    }
    
    @objc func logoutPressed() {
        let viewController = LogoutView()
        viewController.modalPresentationStyle = .overFullScreen
        viewController.delegate = self
        present(viewController, animated: false)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dopDays = viewModel.profileModel != nil ? 3 : 0
        return (viewModel.profileModel?.workDays.count ?? 0) * 4 + dopDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row % 7
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
        let day = viewModel.profileModel?.workDays[index].day
        if day == "Суббота" || day == "Воскресенье" {
            cell.restImage()
        } else {
            if let isWorking = viewModel.profileModel?.workDays[index].checked {
                cell.mainImage.image = isWorking ? UIImage(named: "sun") : UIImage(named: "moon")
            }
        }
        return cell
    }
}

extension ProfileViewController: ProfileViewModelDelegate {
    func reloadData(profileData: ProfileModel) {
        profileView.collectionView.reloadData()
        profileView.name.text = profileData.name
    }
}

extension ProfileViewController: LogoutViewDelegate {
    func logout() {
        viewModel.logout?()
    }
}

#if DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct ProfileViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ProfileViewController(viewModel: ProfileViewModel()).showPreview()
    }
}
#endif
