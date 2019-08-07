//
//  ForexAPI.swift
//  ForexApp
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

class ForexAPI {
    
    private let headers = ["x-rapidapi-host" : "fixer-fixer-currency-v1.p.rapidapi.com", "x-rapidapi-key" : "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
    
    private let baseUrl = "https://fixer-fixer-currency-v1.p.rapidapi.com/"
    
    func getConvertedCurrency(from baseCurrency: String, to targetCurrency: String, amount: Double, completion: @escaping(_ report : CurrencyConverterResult?, Error?)->Void) {
        
        let urlString = "\(baseUrl)convert"
        
        let queryParams = [NSURLQueryItem(name: "from", value: baseCurrency),
        NSURLQueryItem(name: "to", value: targetCurrency),
        NSURLQueryItem(name: "amount", value: "\(amount)")]
        
        let urlComponents = NSURLComponents(string: urlString)
        
        urlComponents?.queryItems = queryParams as [URLQueryItem]
        
        guard let url = urlComponents?.url else {
            let error = NSError(domain: "ForexAPI", code: 1001, userInfo: nil) as Error
            completion(nil,error)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                let error = NSError(domain: "ForexAPI", code: 1002, userInfo: nil) as Error
                completion(nil,error)
                return
            }
            do {
                let convertedResults = try JSONDecoder().decode(CurrencyConverterResult.self, from: data)
                completion(convertedResults, nil)
            } catch let apiError {
                completion(nil, apiError)
                print(apiError)
            }
        }.resume()
    }
    
    func getExchangeRates(from baseCurrency: String, to targetCurrencies: String, completion: @escaping(_ report : ExchangeRateResult?, Error?)->Void){
        
        let queryItems = [NSURLQueryItem(name: "base", value: baseCurrency), NSURLQueryItem(name: "symbols", value: targetCurrencies)]
        let urlComps = NSURLComponents(string: "\(baseUrl)latest")!
        urlComps.queryItems = queryItems as [URLQueryItem]
        let url = urlComps.url!
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                let error = NSError(domain: "ForexAPI", code: 1002, userInfo: nil) as Error
                completion(nil,error)
                return
            }
            do {
                let exchangeRateResults = try JSONDecoder().decode(ExchangeRateResult.self, from: data)
                completion(exchangeRateResults, nil)
            } catch let apiError {
                completion(nil, apiError)
                print(apiError)
            }
            }.resume()
    }
    
    func getSupportedCurrencies(completion: @escaping(_ report : SupportedCurrenciesResult?, Error?)->Void){
        var supportedCurrencies: SupportedCurrenciesResult?
        
        let urlString = "\(baseUrl)symbols"
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "ForexAPI", code: 1001, userInfo: nil) as Error
            completion(nil,error)
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                let error = NSError(domain: "ForexAPI", code: 1002, userInfo: nil) as Error
                completion(nil,error)
                return
            }
            do {
                supportedCurrencies = try JSONDecoder().decode(SupportedCurrenciesResult.self, from: data)
                completion(supportedCurrencies, nil)
            } catch let apiError {
                completion(nil, apiError)
                print(apiError)
            }
            }.resume()
    }
}
