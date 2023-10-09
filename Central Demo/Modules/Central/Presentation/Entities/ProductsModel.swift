//
//  ProductsModel.swift
//  Central Demo
//
//  Created by Shashank Shree on 06/10/23.
//

import Foundation
import SwiftUI

// MARK: - Products
struct Products: Codable {
    var products: [Product]?
}

// MARK: - Product
struct Product: Identifiable, Codable {
    let id : UUID = UUID()
    let name: String?
    let price: AnyValue?
    let discountPercentage: Double?
    let imageURL: String?
    let colorShads: [String]?
    let sizes: [AnyValue]?
    let brandName, promotion: String?
    let stock: Stock?
    var colorShades: ColorShades?
    var discountPrice: String?
    var colorCodes: [Color]?

    mutating func setDiscountPrice(value:String) {
        discountPrice = value
    }

    mutating func setColorShades(value: [String]) {
        colorShades = ColorShades.stringArray(value)
    }

    mutating func setColorCodes(value: [Color]) {
        colorCodes = value
    }
    
    enum CodingKeys: String, CodingKey {
        case name, price
        case discountPercentage = "discount_percentage"
        case imageURL = "image_url"
        case colorShads = "color_shads"
        case sizes
        case brandName = "brand_name"
        case promotion, stock
        case colorShades = "color_shades"
    }
}

enum ColorShades: Codable {
    case string(String)
    case stringArray([String])
    case null

    var strArray: [String]? {
        switch self {
        case .stringArray(let s):
            return s
        case .string(let s):
            return [s]
        case .null:
            return []
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(ColorShades.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ColorShades"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

enum AnyValue: Codable {
    case string(String)
    
    var stringValue: String? {
        switch self {
        case .string(let s):
            return s
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .string("\(x)")
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AnyValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Stock
struct Stock: Codable {
    let isInStock: Bool?

    enum CodingKeys: String, CodingKey {
        case isInStock = "is_in_stock"
    }
}
