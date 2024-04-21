//
//  Presenter.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 3/3/24.
//

import UIKit

protocol Presentable {
    var toPresent: UIViewController { get }
}

extension UIViewController: Presentable {
    var toPresent: UIViewController {
        self
    }
}
