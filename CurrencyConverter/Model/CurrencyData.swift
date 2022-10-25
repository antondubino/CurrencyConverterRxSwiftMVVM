//
//  CurrencyData.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 02.10.2022.
//

import Foundation

class Currency: Codable {
    
    var timestamp: Int
    var base: String
    var rates: [String: Double]
    
    init(timestamp: Int, base: String, rates: [String: Double]) {
        self.timestamp = timestamp
        self.base = base
        self.rates = rates
    }
}

class Rates: Codable {
    
    var key: String
    var value: Double
    
    init(key: String, value: Double) {
        self.key = key
        self.value = value
    }
}

class Country: Codable {
    
    var key: String
    var value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
