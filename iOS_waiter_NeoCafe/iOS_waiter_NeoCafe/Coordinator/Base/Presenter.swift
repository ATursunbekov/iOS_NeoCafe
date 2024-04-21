//
//  Presenter.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
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
