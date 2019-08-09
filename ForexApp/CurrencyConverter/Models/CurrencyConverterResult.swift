//
//  CurrencyConverterResult.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

struct CurrencyConverterResult : Codable {
    
    var success: Bool
    var query: Query?
    var info: Info?
    var date: String?
    var result: Double?
}
