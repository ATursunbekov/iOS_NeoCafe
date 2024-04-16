//
//  GeneralAPI.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 22/3/24.
//

import Moya
import UIKit

enum GeneralAPI {
    case getNotifications
    case getProfileData
    case updateUserData(email: String)
    case getOrderHistory
    case makeOrder(order: BasketModel)
    case getOrderHistoryDetail(id: Int)
}

extension GeneralAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getNotifications:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/notifications")!
        case .getProfileData, .updateUserData:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/profile")!
        case .getOrderHistory, .makeOrder, .getOrderHistoryDetail:
            return URL(string: "https://neo-cafe.up.railway.app/api/v1/order")!
        }
    }

    // https://neo-cafe.up.railway.app/api/v1/profile/update-user?name=Лаура&email=alikhan.tursunbekov@gmail.com
    // https://neo-cafe.up.railway.app/api/v1/order/client-make-order
    var path: String {
        switch self {
        case .getNotifications:
            return ""
        case .getProfileData:
            return "/user-profile"
        case .updateUserData:
            return "/update-user"
        case .getOrderHistory:
            return "/order-history"
        case .makeOrder:
            return "/client-make-order"
        case .getOrderHistoryDetail:
            return "/order-detailed-history"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getNotifications, .getProfileData, .getOrderHistory, .getOrderHistoryDetail:
            return .get
        case .updateUserData:
            return .put
        case .makeOrder:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .getNotifications,
             .getProfileData,
             .getOrderHistory:
            return .requestPlain
        case let .updateUserData(email):
            return .requestParameters(parameters: ["name": "Laura", "email": email], encoding: URLEncoding.queryString)
        case let .makeOrder(order):
            return .requestJSONEncodable(order)
        case let .getOrderHistoryDetail(id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getNotifications,
             .getProfileData,
             .updateUserData,
             .getOrderHistory,
             .getOrderHistoryDetail:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)"]
        case .makeOrder:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)",
                    "Content-Type": "application/json"]
        }
    }
}
