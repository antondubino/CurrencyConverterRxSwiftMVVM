//
//  MainViewControllerViewModelType.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 02.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainViewControllerViewModelType {
    
    func getDate() -> String
    func findCurrency(_ first: Double, _ second: Double) -> Double
    func formattedNumber(_ value: Double) -> String
    func saveFirstData(_ string: String)
    func saveSecondData(_ string: String)
    func saveNumberData(_ string: String)
}
