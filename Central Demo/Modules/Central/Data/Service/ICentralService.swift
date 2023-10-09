//
//  ICentralService.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

protocol ICentralService {
    func fetchProductsListFromNetwork(completion: @escaping (Result<Products, Error>) -> Void)
}
