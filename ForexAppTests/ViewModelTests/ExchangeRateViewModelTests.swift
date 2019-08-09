//
//  ExchangeRateViewModelTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class ExchangeRateViewModelTests: XCTestCase {

    var apiClient: MockForexAPI!
    var exchangeRateVM: ExchangeRateViewModel!
    
    override func setUp() {
        apiClient = MockForexAPI()
        exchangeRateVM = ExchangeRateViewModel(apiClient: apiClient)
    }
    
    func test_WhenCurrencyConverterViewModel_ThenShouldCallAPI(){
        exchangeRateVM.getExchangeRates(from: "EUR", to: "INR") { (_ , _ ) in
        }
        
        XCTAssertTrue(apiClient.getExchangeRatesMethodCalled)
    }

}
