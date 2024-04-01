//
//  OrdersAPI.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 29/03/24.
//

import UIKit
import Moya

enum OrdersAPI {
    case login(identifier: String, password: String)
    case confirm(email: String, code: String)
    case refreshToken(email: String, token: String)
}

extension OrdersAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/auth")!
    }
    
    var path: String {
        switch self {
        case .login:
            "/waiter-login"
        case .confirm:
            "/code-confirm"
        case .refreshToken:
            "/refresh-token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .confirm, .refreshToken:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let identifier, let password):
            return .requestParameters(parameters: ["identifier": identifier, "password": password], encoding: URLEncoding.queryString)
        
        case .confirm(let email, let code):
            return .requestParameters(parameters: ["email": email, "code": code], encoding: JSONEncoding.default)
            
        case .refreshToken(email: let email, token: let token):
            return .requestParameters(parameters: ["email": email, "token": token], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login, .confirm, .refreshToken:
            return ["Content-Type": "application/json"]
        }
    }
}
