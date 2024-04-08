//
//  CategoriesAPI.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 02/04/24.
//

import UIKit
import Moya

enum CategoriesAPI {
    case getAllCategories
}

extension CategoriesAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1")!
    }
    
    var path: String {
        switch self {
        case .getAllCategories:
            return "/category/all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllCategories:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllCategories:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAllCategories:
            return ["accept": "application/json"]
        }
    }
}
