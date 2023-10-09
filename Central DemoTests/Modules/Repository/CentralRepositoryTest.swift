//
//  CentralRepositoryTest.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

import XCTest
@testable import Central_Demo

final class CentralRepositoryTest: XCTestCase {

    var centralRepository: ICentralRepository!
    var mockCentralService: MockCentralService!
    
    override func setUp() {
        super.setUp()
        mockCentralService = MockCentralService()
        centralRepository = CentralRepositoryImpl(service: mockCentralService)
    }
    
    override func tearDown() {
        centralRepository = nil
        mockCentralService = nil
        super.tearDown()
    }
    
    func testCentralRepository_Success() {
        let expectation = expectation(description: "Central Repository of Success Case")
        mockCentralService.response = MockData.products
        mockCentralService.fetchProductsListFromNetwork { (result: Result<Products, Error>) in
            switch result {
            case let .success(response):
                if (response.products?.count ?? 0) > 0 {
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testCentralRepository_Failure() {
        let expectation = expectation(description: "Central Repositoy of Failure Case")
        mockCentralService.error = NetworkError.failed
        mockCentralService.fetchProductsListFromNetwork { (result: Result<Products, Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.failed)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
