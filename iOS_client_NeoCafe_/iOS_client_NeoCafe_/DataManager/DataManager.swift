//
//  DataManager.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/2/24.
//

import UIKit

class DataManager {
    
    static var shared = DataManager()
    
    private var branch = ""
    var showedBranches = false
    
    func setBranch(_ name: String) {
        branch = name
    }
    
    func getBranch() -> String {
        branch
    }
}
