//
//  CountriesTableViewCell.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 08.10.2022.
//

import UIKit
import RxSwift

class CountriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var countries: [Country] = []
    
    func initCell(data: Country) {
        for (key, value) in Countries().allCountries {
            countries.append(Country(key: key, value: value))
        }
        self.countryImage.rx.image.onNext(UIImage(named: data.key))
        for k in [data.key] {
            for (key, value) in Countries().allCountries {
                if k == key {
                    self.countryLabel.rx.text.onNext(value)
                }
            }
        }
        self.currencyLabel.rx.text.onNext(data.key)
    }
    
}
