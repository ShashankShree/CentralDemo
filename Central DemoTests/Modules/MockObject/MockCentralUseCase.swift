//
//  MockUseCase.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

@testable import Central_Demo

final class MockCentralUseCase: ICentralUseCase {
    
    var productsList: Products?
    var error: Error?
    
    func fetchProductsList(completion: @escaping DomainResponse) {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let productsList = productsList {
            completion(.success(productsList))
        }
    }
}
