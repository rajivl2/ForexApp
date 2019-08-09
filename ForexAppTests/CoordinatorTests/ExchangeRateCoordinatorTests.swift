//
//  ExchangeRateCoordinatorTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 09/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class ExchangeRateCoordinatorTests: XCTestCase {

    var exchangeRateCoordinator: ExchangeRateCoordinator!
    var mockNavController: MockNavigationController!
    
    override func setUp() {
        mockNavController = MockNavigationController()
        exchangeRateCoordinator = ExchangeRateCoordinator(navigationController: mockNavController)
    }

    func test_GivenExchangeRateViewController_WhenExchangeRateCalculateButtonTapped_ThenShouldShowExchangeRateTableViewController(){
        
        exchangeRateCoordinator.start()
        
        XCTAssert(self.mockNavController.topViewController?.isKind(of: ExchangeRateViewController.self) ?? false)
    }

}
