// ProductsProtocol.swift
// Food_Delivery. Created by Zlata Guseva.

import Moya

protocol ProductsProtocol {
    func getProducts(completion: @escaping ([Product]) -> Void)
    func getCategories(completion: @escaping ([Category]) -> Void)
    func getBanners(completion: @escaping ([Banner]) -> Void)
}
