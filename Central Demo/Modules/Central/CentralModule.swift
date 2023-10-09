//
//  CentralModule.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

final class CentralModule {
    
    private let networkManager: INetworkManager

    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func generateCentralUseCase() -> ICentralUseCase {
        let useCase = CentralUseCaseImpl(respository: generateCentralRepository())
        return useCase
    }
    
    private func generateCentralRepository() -> ICentralRepository {
        let repository = CentralRepositoryImpl(service: createCentralService())
        return repository
    }
    
    private func createCentralService() -> ICentralService {
        let service = CentralServiceImpl(networkManager: networkManager)
        return service
    }
}
