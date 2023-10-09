//
//  CentralServiceTest.swift
//  Central DemoTests
//
//  Created by Shashank Shree on 09/10/23.
//

import XCTest
@testable import Central_Demo

final class CentralServiceTest: XCTestCase {

    var centralService: ICentralService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        centralService = CentralServiceImpl(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        centralService = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testCentralService_Success() {
        let expectation = expectation(description: "Central Service on Success Case")
        mockNetworkManager.productList = MockData.products
        centralService.fetchProductsListFromNetwork { (result: Result<Products, Error>) in
            switch result {
            case let .success(productList):
                if (productList.products?.count ?? 0) > 0 {
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testCentralService_Failure() {
        let expectation = expectation(description: "Central Service on Failure Case")
        mockNetworkManager.error = NSError(domain: "FailedError", code: 0)
        centralService.fetchProductsListFromNetwork { (result: Result<Products, Error>) in
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
