// Product.swift
// Food_Delivery. Created by Zlata Guseva.

import Foundation

struct Product: Codable {
    let id, name, description, categoryID: String
    let price: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case categoryID = "categoryId"
        case price, imageURL
    }
}
