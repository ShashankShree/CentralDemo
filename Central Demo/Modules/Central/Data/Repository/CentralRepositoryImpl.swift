//
//  CentralRepositoryImpl.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

final class CentralRepositoryImpl: ICentralRepository {
    
    private let service: ICentralService
    
    init(service: ICentralService) {
        self.service = service
    }
    
    func fetchProductsList(completion: @escaping DataResponse) {
        self.service.fetchProductsListFromNetwork {
            (result: Result<Products, Error>) in
            switch result {
            case .success(let productList):
                completion(.success(productList))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }
}
