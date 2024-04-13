//
//  Ext+UIViewController.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
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
        }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}

