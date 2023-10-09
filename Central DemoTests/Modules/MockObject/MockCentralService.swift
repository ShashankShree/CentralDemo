//
//  MockService.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

@testable import Central_Demo

final class MockCentralService: ICentralService {
    
    var response: Products?
    var error: Error?
    
    func fetchProductsListFromNetwork(completion: @escaping (Result<Products, Error>) -> Void) {
        if let error = error {
            return completion(.failure(error))
        }
        if let response = response {
            return completion(.success(response))
        }
    }
}
