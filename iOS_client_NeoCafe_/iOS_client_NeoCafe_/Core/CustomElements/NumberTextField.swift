//
//  NumberTextField.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 10/2/24.
//

import UIKit
import SnapKit

class NumberTextField: UIView {
    let text: String
    
    init(text: String) {
        self.text = text
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
