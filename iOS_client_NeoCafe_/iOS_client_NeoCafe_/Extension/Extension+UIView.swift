//
//  Extension+UIView.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 14/4/24.
//

import UIKit

protocol Nibless {
    init()
}

extension Nibless where Self: UIView {
    @available(*, unavailable, message: "This view cannot be instantiated from a nib or storyboard.")
    init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
