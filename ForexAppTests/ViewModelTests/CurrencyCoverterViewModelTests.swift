//
//  CurrencyCoverterViewModelTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class CurrencyCoverterViewModelTests: XCTestCase {
    
    var apiClient: MockForexAPI!
    var currencyConverterVM: CurrencyConverterViewModel!

    override func setUp() {
        apiClient = MockForexAPI()
        currencyConverterVM = CurrencyConverterViewModel(apiClient: apiClient)
    }

    func testWhenCurrencyConverterViewModelthenShouldCallAPI(){
        currencyConverterVM.getConvertedCurrency(from: "USD", to: "INR", amount: 10) { (_ , _ ) in }
        
        XCTAssertTrue(apiClient.getConvertedCurrencyMethodCalled)
        
        currencyConverterVM.getSupportedCurrencies { (result , error ) in
            XCTAssertEqual(self.apiClient.supportedCurrency.success, result?.success)
        }
        
        XCTAssertTrue(apiClient.getSupportedCurrenciesMethodCalled)
    }
}
