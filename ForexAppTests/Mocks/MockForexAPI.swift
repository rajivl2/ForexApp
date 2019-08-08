//
//  MockForexAPI.swift
//  ForexAppTests
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
@testable import ForexApp

class MockForexAPI: ForexAPI{
    
    var getConvertedCurrencyMethodCalled = false
    var getExchangeRatesMethodCalled = false
    var getSupportedCurrenciesMethodCalled = false
    
    var supportedCurrency = SupportedCurrenciesResult(success: false, symbols: [:])
    
    override func getConvertedCurrency(from baseCurrency: String, to targetCurrency: String, amount: Double, completion: @escaping (CurrencyConverterResult?, Error?) -> Void) {
        self.getConvertedCurrencyMethodCalled = true
    }
    
    override func getExchangeRates(from baseCurrency: String, to targetCurrencies: String, completion: @escaping (ExchangeRateResult?, Error?) -> Void) {
        self.getExchangeRatesMethodCalled = true
    }
    
    override func getSupportedCurrencies(completion: @escaping (SupportedCurrenciesResult?, Error?) -> Void) {
        self.getSupportedCurrenciesMethodCalled = true
        self.supportedCurrency.success = true
        completion(supportedCurrency,nil)
    }
}
