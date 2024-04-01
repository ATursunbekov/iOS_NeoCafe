//
//  NewOrderAPI.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import Moya

enum NewOrderAPI {
    case getAllProducts
}

extension NewOrderAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app")!
    }
    
    var path: String {
        switch self {
        case .getAllProducts:
            return "/api/v1/menu/all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllProducts:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllProducts:
            return .requestParameters(parameters: ["number": 1, "size": 10], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAllProducts:
            return ["accept": "application/json", "Content-Type": "application/json"]
        }
    }
}
