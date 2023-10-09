//
//  CentralViewModelTest.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

import XCTest
@testable import Central_Demo

final class CentralViewModelTest: XCTestCase {

    var viewModel: CentralViewModel!
    var mockCentralUseCase: MockCentralUseCase!
    
    override func setUp() {
        super.setUp()
        mockCentralUseCase = MockCentralUseCase()
        viewModel = CentralViewModel(useCase: mockCentralUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockCentralUseCase = nil
        super.tearDown()
    }
    
    func testSuccessScenario() {
        mockCentralUseCase.productsList = MockData.products
        viewModel.fetchProductsData()
        XCTAssertTrue(viewModel.productList?.count == 30)
    }

    func testErrorScenario() {
        mockCentralUseCase.error = NSError(domain: "Failed_Error", code: 0)
        viewModel.fetchProductsData()
        XCTAssertNil(viewModel.productList)
    }
}
