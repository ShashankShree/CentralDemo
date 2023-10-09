//
//  MockNetworkManager.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation
@testable import Central_Demo

final class MockNetworkManager: INetworkManager {
    
    var productList: Products?
    var error: Error?
    
    func request<T>(fromUrl url: URL, completion: @escaping Response<T>) where T : Decodable {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let productList = productList {
            completion(.success(productList as! T))
        }
    }
}
