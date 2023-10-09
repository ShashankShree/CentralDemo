//
//  CentralUseCaseTest.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

import XCTest
@testable import Central_Demo

final class CentralUseCaseTest: XCTestCase {
    
    var centralUseCase: ICentralUseCase!
    var mockCentralRepository: MockCentralRepository!
    
    override func setUp() {
        super.setUp()
        mockCentralRepository = MockCentralRepository()
        centralUseCase = CentralUseCaseImpl(respository: mockCentralRepository)
    }
    
    override func tearDown() {
        centralUseCase = nil
        mockCentralRepository = nil
        super.tearDown()
    }
    
    func testCentralUseCaseSuccess() {
        let expectation = expectation(description: "CentralUseCase Success Case")
        mockCentralRepository.productsList = MockData.products
        centralUseCase.fetchProductsList { (result: Result<Products, Error>) in
            switch result {
            case let .success(products):
                XCTAssertTrue(products.products?.count == 30)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testCentralUseCaseFailure() {
        let expectation = expectation(description: "CentralUseCase Failure Case")
        mockCentralRepository.error = NSError(domain: "Failed_Error", code: 0)
        centralUseCase.fetchProductsList { (result: Result<Products, Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
