//
//  BranchApi.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/3/24.
//

import UIKit
import Moya

enum BranchAPI {
    case getAllFilials
    case getAllNames
}

extension BranchAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/filial")!
    }
    
    var path: String {
        switch self {
        case .getAllFilials:
            return "/all"
        case .getAllNames:
            return "/all-names"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllFilials, .getAllNames:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllFilials:
            let parameters = ["page": 1, "size": 20]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .getAllNames:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAllFilials, .getAllNames:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)"]
        }
    }
}
