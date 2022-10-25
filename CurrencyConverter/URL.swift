//
//  Identity.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 27.09.2022.
//

import Foundation

class Url {
    static let shared = Url()
    
    func getUrl() -> String {
        return "https://openexchangerates.org/api/latest.json?app_id=853542e06e974c1ab0404c5656cadfc8"
    }
}

