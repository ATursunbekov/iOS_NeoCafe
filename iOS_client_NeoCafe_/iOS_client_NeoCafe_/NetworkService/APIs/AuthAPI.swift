//
//  AuthAPI.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 17/2/24.
//

import Moya
import UIKit

enum AuthAPI {
    case signIn(email: String)
    case signUp(email: String)
    case confirm(email: String, code: String)
    case refreshToken(email: String, token: String)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/auth")!
    }

    var path: String {
        switch self {
        case .signUp:
            "/sign-up"
        case .signIn:
            "/login-no-pass"
        case .confirm:
            "/code-confirm"
        case .refreshToken:
            "/refresh-token"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signIn, .signUp, .confirm:
            return .post
        case .refreshToken:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case let .signUp(email), let .signIn(email):
            return .requestParameters(parameters: ["email": email], encoding: URLEncoding.queryString)
        case let .confirm(email, code):
            return .requestParameters(parameters: ["email": email, "code": code], encoding: JSONEncoding.default)
        case let .refreshToken(email: email, token: token):
            return .requestParameters(parameters: ["email": email, "token": token], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .signIn, .signUp, .confirm, .refreshToken:
            return .none
        }
    }
}
