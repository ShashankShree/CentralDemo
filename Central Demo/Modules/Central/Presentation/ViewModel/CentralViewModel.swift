//
//  CentralViewModelImpl.swift
//  Central Demo
//
//  Created by Shashank Shree on 09/10/23.
//

import SwiftUI

class CentralViewModel: ObservableObject {
    @Published var productList: [Product]?
    
    private let useCase: ICentralUseCase
    private let appDIContainer = AppDIContainer()
    
    // MARK: Object Lifecycle
    init(useCase: ICentralUseCase? = nil) {
        self.useCase = useCase ?? appDIContainer.loadDependency()
        fetchProductsData()
    }
    
    func fetchProductsData()  {
        self.useCase.fetchProductsList{ result in
            switch result {
            case let .success(productList):
                self.processProductList(productList: productList)
            case let .failure(error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    private func processProductList(productList: Products?) {
        let updateList = productList?.products?.map{ product in
            var modifiedProduct = product
            if let discountPer = modifiedProduct.discountPercentage, discountPer > 0.0, let actualPrice = Double(modifiedProduct.price?.stringValue ?? "") {
                let discountPrice = String(actualPrice - round((actualPrice * discountPer)/100))
                modifiedProduct.setDiscountPrice(value: discountPrice)
            }
            if (modifiedProduct.colorShads?.count ?? 0) > 0 {
                modifiedProduct.setColorShades(value: modifiedProduct.colorShads ?? [])
            }
            
            var colorCodes: [Color] = []
            modifiedProduct.colorShades?.strArray?.forEach({ colorName in
                if colorName.contains("#") {
                    colorCodes.append(Color(hex: colorName))
                } else {
                    colorCodes.append(Color(wordName: colorName) ?? .white)
                }
            })
            modifiedProduct.setColorCodes(value: colorCodes)
            return modifiedProduct
        }
        self.productList = updateList
    }
}
