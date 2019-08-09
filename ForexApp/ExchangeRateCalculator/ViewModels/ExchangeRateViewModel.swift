//
//  ExchangeRateViewModel.swift
//  ForexApp
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

class ExchangeRateViewModel {
    
    private let apiClient: ForexAPI
    
    init(apiClient: ForexAPI) {
        self.apiClient = apiClient
    }
    
    convenience init () {
        self.init(apiClient: ForexAPI())
    }
    
    func getExchangeRates(from baseCurrency: String, to targetCurrencies: String, completion: @escaping(_ report : ExchangeRateResult?, Error?)->Void){
        apiClient.getExchangeRates(from: baseCurrency, to: targetCurrencies, completion: completion)
    }
}
