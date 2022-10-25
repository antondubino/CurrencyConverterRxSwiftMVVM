//
//  CountriesViewModel.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 08.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CountriesViewModel: CountriesViewControllerViewModelType {
    
    let data = CurrencyParsing().loadRates()
    
    var countryNumber = 0
 
// Sorting countries
    
    func allCountries() -> BehaviorRelay<[Country]> {
        var countries: [Country] = []
        for (key, value) in Countries().allCountries {
            countries.append(Country(key: key, value: value))
        }
        countries = countries.sorted(by: { $0.value < $1.value })
        let tableViewItems = BehaviorRelay.init(value: countries)
        return tableViewItems
    }
 
// Saving data
    
    func saveFirstData(_ object: Event<ControlEvent<Country>.Element>) {
        FirstCountryPersistance.shared.removeAll()
        let item = FirstCountryData()
        item.name = object.element!.key
        item.image = object.element!.key
        FirstCountryPersistance.shared.save(item: item)
    }
    
    func saveSecondData(_ object: Event<ControlEvent<Country>.Element>) {
        SecondCountryPersistance.shared.removeAll()
        let item = SecondCountryData()
        item.name = object.element!.key
        item.image = object.element!.key
        SecondCountryPersistance.shared.save(item: item)
    }
    
}
