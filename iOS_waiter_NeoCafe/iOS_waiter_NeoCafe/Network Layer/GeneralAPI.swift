//
//  NotificationAPI.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 5/4/24.
//

import UIKit
import Moya

enum GeneralAPI {
    case getNotifications
}

extension GeneralAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getNotifications:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/notifications")!
        }
    }
    //https://neo-cafe.up.railway.app/api/v1/profile/update-user?name=Лаура&email=alikhan.tursunbekov@gmail.com
    //https://neo-cafe.up.railway.app/api/v1/order/client-make-order
    var path: String {
        switch self {
        case .getNotifications:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNotifications:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getNotifications:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getNotifications:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)"]
        }
    }
}
