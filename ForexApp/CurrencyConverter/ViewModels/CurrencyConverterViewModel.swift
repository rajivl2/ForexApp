//
//  CurrencyConverterViewModel.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

class CurrencyConverterViewModel {
    
    private let apiClient: ForexAPI
    
    init(apiClient: ForexAPI) {
        self.apiClient = apiClient
    }
    
    convenience init () {
        self.init(apiClient: ForexAPI())
    }
    
    func getConvertedCurrency(from baseCurrency: String, to targetCurrency: String, amount: Double, completion: @escaping(_ report : CurrencyConverterResult?, Error?)->Void){
        apiClient.getConvertedCurrency(from: baseCurrency, to: targetCurrency, amount: amount, completion: completion)
    }
    
    func getSupportedCurrencies(completion: @escaping(_ report : SupportedCurrenciesResult?, Error?)->Void){
        apiClient.getSupportedCurrencies(completion: completion)
    }
    
}
