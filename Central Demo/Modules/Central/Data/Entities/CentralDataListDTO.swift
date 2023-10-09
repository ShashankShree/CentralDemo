//
//  CentralDataListDTO.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation

struct CentralDataListDTO {
    let products: [Product]
}

extension CentralDataListDTO {
    func toDmoain() -> CentralDomainListDTO {
        return .init(products: products)
    }
}
