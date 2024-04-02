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
    case getProductsByCategory(category: String)
    case getProductsByName(name: String)
}

extension NewOrderAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/menu")!
    }
    
    var path: String {
        switch self {
        case .getAllProducts:
            return "/all"
        case .getProductsByName:
            return "/find-by-name"
        case .getProductsByCategory:
            return "/find-by-category"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllProducts, .getProductsByName, .getProductsByCategory:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllProducts:
            return .requestParameters(parameters: ["number": 1, "size": 10], encoding: URLEncoding.queryString)
            
        case .getProductsByName(let name):
            return .requestParameters(parameters: ["name": name, "number": 1, "size": 10], encoding: URLEncoding.queryString)
            
        case .getProductsByCategory(let category):
            return .requestParameters(parameters: ["category": category, "number": 1, "size": 10], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAllProducts, .getProductsByName, .getProductsByCategory:
            return ["accept": "application/json"]
        }
    }
}


//let provider = MoyaProvider<NewOrderAPI>()
//
//provider.request(.getAllProducts) { result in
//    switch result {
//    case .success(let response):
//        // Handle success
//        print(response)
//    case .failure(let error):
//        // Handle failure
//        print(error)
//    }
//}
//
//provider.request(.getProductsByName(name: "латте")) { result in
//    switch result {
//    case .success(let response):
//        // Handle success
//        print(response)
//    case .failure(let error):
//        // Handle failure
//        print(error)
//    }
//}
//
//provider.request(.getProductsByCategory(category: "кофе")) { result in
//    switch result {
//    case .success(let response):
//        // Handle success
//        print(response)
//    case .failure(let error):
//        // Handle failure
//        print(error)
//    }
//}
