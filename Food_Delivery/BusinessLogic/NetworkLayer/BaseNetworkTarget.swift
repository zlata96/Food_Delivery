// BaseNetworkTarget.swift
// Food_Delivery. Created by Zlata Guseva.

import Foundation
import Moya

protocol BaseNetworkTarget: TargetType {}

extension BaseNetworkTarget {
    var parameterEncoding: ParameterEncoding {
        JSONEncoding.default
    }

    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }

    var baseURL: URL {
        guard let url = URL(string: "http://api-test.funnypuny.space") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }

    var sampleData: Data {
        Data()
    }
}
