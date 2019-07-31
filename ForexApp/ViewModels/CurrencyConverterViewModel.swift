//
//  CurrencyConverterViewModel.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

class CurrencyConverterViewModel {
    
    let headers = ["x-rapidapi-host" : "fixer-fixer-currency-v1.p.rapidapi.com", "x-rapidapi-key" : "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
    
    func getConvertedCurrency(from: String, to: String, amount: Double, completion: @escaping(_ report : CurrencyConverterResult?, Error?)->Void){
        
        var convertedResults: CurrencyConverterResult?
        
        let urlString = "https://fixer-fixer-currency-v1.p.rapidapi.com/convert?from=\(from)&to=\(to)&amount=\(amount)"
        guard let url = URL(string: urlString) else { fatalError("Error while parsing url") }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                convertedResults = try JSONDecoder().decode(CurrencyConverterResult.self, from: data)
                completion(convertedResults, nil)
            } catch let apiError {
                completion(nil, apiError)
                print(apiError)
            }
            }.resume()
        
    }
    
}
