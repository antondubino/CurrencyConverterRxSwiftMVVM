//
//  MainViewModel.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 02.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: MainViewControllerViewModelType {

// Getting date
    
    func getDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm"
        return formatter.string(from: currentDate)
    }
 
// Finding currency
    
    func findCurrency(_ first: Double, _ second: Double) -> Double {
        let finally = second / first
        return finally
    }
    
// Formatter
    
    func formattedNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value))!
    }
 
// Saving data
    
    func saveFirstData(_ string: String) {
        FirstCountryPersistance.shared.removeAll()
        let item = FirstCountryData()
        item.name = string
        item.image = string
        FirstCountryPersistance.shared.save(item: item)
    }
    
    func saveSecondData(_ string: String) {
        SecondCountryPersistance.shared.removeAll()
        let item2 = SecondCountryData()
        item2.name = string
        item2.image = string
        SecondCountryPersistance.shared.save(item: item2)
    }
    
    func saveNumberData(_ string: String) {
        let item = FirstNumberData()
        item.number = string
        FirstNumberPersistance.shared.save(item: item)
    }
    
}
