//
//  CentralUseCase.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

typealias DomainResponse = (Result<Products, Error>) -> Void

protocol ICentralUseCase {
    func fetchProductsList(completion: @escaping DomainResponse)
}
