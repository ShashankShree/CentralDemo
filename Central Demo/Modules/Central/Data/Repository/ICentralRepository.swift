//
//  ICentralRepository.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation
typealias DataResponse = (Result<Products, Error>) -> Void

protocol ICentralRepository {
    func fetchProductsList(completion: @escaping DataResponse)
}
