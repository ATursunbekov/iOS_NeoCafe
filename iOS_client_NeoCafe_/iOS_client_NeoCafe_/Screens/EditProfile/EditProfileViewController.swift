//
//  EditProfileScreen.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 25/3/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    lazy var editView = EditProfileView()
    var viewModel: EditProfileProtocol
    
    init(viewModel: EditProfileProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTargets()
        viewModel.delegate = self
        navigationController?.isNavigationBarHidden = true
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
        if let text = editView.textField.textField.text {
            print(text)
            viewModel.updateData(newEmail: text)
        }
    }
}

extension EditProfileViewController: EditProfileDelegate {
    func savingData() {
        navigationController?.popViewController(animated: true)
    }
}
