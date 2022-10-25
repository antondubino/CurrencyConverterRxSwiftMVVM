//
//  CountriesViewControllerViewModelType.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 08.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol CountriesViewControllerViewModelType {
    
    var data: Observable<[Rates]> { get }
    var countryNumber: Int { get set }
    
    func allCountries() -> BehaviorRelay<[Country]>
    func saveFirstData(_ object: Event<ControlEvent<Country>.Element>)
    func saveSecondData(_ object: Event<ControlEvent<Country>.Element>)
}
