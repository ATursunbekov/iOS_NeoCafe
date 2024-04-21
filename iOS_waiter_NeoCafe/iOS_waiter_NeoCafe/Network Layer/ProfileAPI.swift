//
//  ProfileAPI.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 4/4/24.
//

import UIKit
import Moya

enum ProfileAPI {
    case getProfile
}

extension ProfileAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/profile")!
    }
    
    var path: String {
        switch self {
        case .getProfile:
            return "/staff-profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProfile:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getProfile:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getProfile:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)"]
        }
    }
}
