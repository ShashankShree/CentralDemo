//
//  CentralUseCaseImpl.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

final class CentralUseCaseImpl: ICentralUseCase {
        
    private let respository: ICentralRepository
    
    init(respository: ICentralRepository) {
        self.respository = respository
    }
    
    func fetchProductsList(completion: @escaping DomainResponse) {
        return self.respository.fetchProductsList { (result: Result<Products, Error>) in
            switch result {
            case .success(let productsList):
                completion(.success(productsList))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }
}
