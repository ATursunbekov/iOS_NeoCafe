//
//  EditProfileScreen.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/3/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    lazy var editView = EditProfileView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTargets()
    }
    
    override func loadView() {
        view = editView
    }
    
    func setupTargets() {
        editView.backButton.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        editView.button.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }
    
    @objc func exitTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func savePressed() {
        navigationController?.popViewController(animated: true)
    }
}

