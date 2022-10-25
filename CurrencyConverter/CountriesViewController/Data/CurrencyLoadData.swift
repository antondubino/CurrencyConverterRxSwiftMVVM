//
//  CurrencyLoadData.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 02.10.2022.
//

import Foundation
import RxSwift
import RxAlamofire

class CurrencyParsing {
    
    let db = DisposeBag()
    
    func loadRates() -> Observable<[Rates]> {
        return RxAlamofire.data(.get, Url.shared.getUrl()).map { response in
            do {
                let data = try JSONDecoder().decode(Currency.self, from: response).rates
                var countries: [Rates] = []
                for (key, value) in data {
                    countries.append(Rates(key: key, value: value))
                }
                return countries
            } catch {
                print(error)
                return []
            }
        }
    }
}
