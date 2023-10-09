//
//  CentralDomainListDTO.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import Foundation


struct CentralDomainListDTO {
    let products: [Product]
}

extension CentralDomainListDTO {
    func toPresentation() -> Products {
        return .init(products: products)
    }
}
