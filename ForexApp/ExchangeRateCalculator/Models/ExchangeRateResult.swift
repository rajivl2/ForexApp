//
//  ExchangeRateResult.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

struct ExchangeRateResult : Decodable {
    
    var success: Bool
    var timestamp: Double?
    var base: String?
    var date: String?
    var rates: [String:Double]
}
