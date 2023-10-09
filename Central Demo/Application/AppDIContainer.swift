//
//  AppDIContainer.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

final class AppDIContainer {
    
    func loadDependency()-> ICentralUseCase {
        let module = CentralModule(networkManager: NetworkManager.initObject)
        return module.generateCentralUseCase()
    }
}
