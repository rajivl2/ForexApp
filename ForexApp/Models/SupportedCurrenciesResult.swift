//
//  SupportedCurrenciesResult.swift
//  ForexApp
//
//  Created by Ford Labs on 02/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

struct SupportedCurrenciesResult : Codable {
    
    var success: Bool
    var symbols: [String: String]
}
