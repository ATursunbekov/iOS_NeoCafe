//
//  MenuAPI.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import Moya
import UIKit

enum MenuAPI {
    case getPopular
    case getCategoryProducts(String)
    case getSearchProducts(String)
    case getProductDetail(Int)
}

extension MenuAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://neo-cafe.up.railway.app/api/v1/menu")!
    }

    var path: String {
        switch self {
        case .getPopular:
            return "/popular"
        case let .getCategoryProducts(categoryName):
            return "/find-by-category/\(categoryName)"
        case let .getSearchProducts(searchText):
            return "/find-by-name/\(searchText)"
        case let .getProductDetail(id):
            return "/find-by-id/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getPopular, .getCategoryProducts, .getSearchProducts, .getProductDetail:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getPopular, .getProductDetail:
            return .requestPlain
        case .getCategoryProducts, .getSearchProducts:
            let parameters = ["page": 1, "size": 20]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getPopular, .getCategoryProducts, .getSearchProducts, .getProductDetail:
            return ["Authorization": "Bearer \(DataManager.shared.tokens.accessToken)"]
        }
    }
}
