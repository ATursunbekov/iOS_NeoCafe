//
//  GeneralAPI.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import UIKit
import Moya

enum GeneralAPI {
    case getNotifications
    case getProfileData
    case updateUserData(email: String)
}

extension GeneralAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getNotifications:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/notifications")!
        case .getProfileData:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/profile")!
        case .updateUserData:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/profile")!
        }
    }
    
    var path: String {
        switch self {
        case .getNotifications:
            return ""
        case .getProfileData:
            return "/user-profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNotifications, .getProfileData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getNotifications, .getProfileData:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getNotifications, .getProfileData:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)"]
        }
    }
}
