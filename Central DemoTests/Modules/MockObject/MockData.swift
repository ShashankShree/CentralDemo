//
//  MockData.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation
@testable import Central_Demo

final class MockData {
    
    static var products: Products {
        try! JSONDecoder().decode(Products.self, from: ProductsData)
    }
    
    static var ProductsData: Data {
        loadJsonData("products")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle.main.path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
