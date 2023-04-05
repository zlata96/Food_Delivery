// ProductsAPI.swift
// Food_Delivery. Created by Zlata Guseva.

import Foundation

import Moya

enum ProductsAPI {
    case getProducts
    case getCategories
    case getBanners
}

extension ProductsAPI: BaseNetworkTarget {
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .getCategories:
            return "/categories"
        case .getBanners:
            return "/banners"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getProducts, .getCategories, .getBanners:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getProducts, .getCategories, .getBanners:
            return .requestPlain
        }
    }
}
