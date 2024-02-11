//
//  Extension+UIViewController.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import SwiftUI

@available(iOS 13.0, *)
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//            if let colorChangeVC = uiViewController as? ColorChangeViewController {
//                colorChangeVC.toggleColor()
//            }
        }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}
