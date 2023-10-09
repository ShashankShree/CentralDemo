//
//  CentralServiceImpl.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

final class CentralServiceImpl: ICentralService {
        
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }

    func fetchProductsListFromNetwork(completion: @escaping (Result<Products, Error>) -> Void) {
        self.networkManager.request(fromUrl: Configuration.centralListUrl, completion: completion)
    }
}
