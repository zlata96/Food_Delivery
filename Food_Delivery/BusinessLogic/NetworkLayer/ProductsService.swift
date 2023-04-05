// ProductsService.swift
// Food_Delivery. Created by Zlata Guseva.

import Foundation
import Moya

class ProductsService: ProductsProtocol {
    var provider: MoyaProvider<ProductsAPI>

    init(provider: MoyaProvider<ProductsAPI> = MoyaProvider()) {
        self.provider = provider
    }

    func getProducts(completion: @escaping ([Product]) -> Void) {
        provider.request(.getProducts) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Product].self, from: response.data)
                    completion(results)
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }

    func getCategories(completion: @escaping ([Category]) -> Void) {
        provider.request(.getCategories) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Category].self, from: response.data)
                    completion(results)
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }

    func getBanners(completion: @escaping ([Banner]) -> Void) {
        provider.request(.getBanners) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Banner].self, from: response.data)
                    completion(results)
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
