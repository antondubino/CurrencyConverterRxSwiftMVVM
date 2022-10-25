//
//  MainRealmData.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 16.10.2022.
//

import Foundation
import RealmSwift

class FirstCountryData: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
}

class SecondCountryData: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
}

class FirstNumberData: Object {
    
    @objc dynamic var number: String = "0"
}

class SecondNumberData: Object {
    
    @objc dynamic var number: String = "0"
}

class FirstCountryPersistance {
    
    static let shared = FirstCountryPersistance()
    
    private let realm = try! Realm()
    
    func save(item: FirstCountryData) {
        try! realm.write{
            realm.add(item)
        }
    }
    
    func getItems() -> Results<FirstCountryData> {
        realm.objects(FirstCountryData.self)
    }
    
    func remove(item: FirstCountryData) {
        try! realm.write {
            realm.delete(item)
        }
    }
    
    func removeAll() {
        try! realm.write {
            for i in getItems() {
                realm.delete(i)
            }
        }
    }
}

class SecondCountryPersistance {
    
    static let shared = SecondCountryPersistance()
    
    private let realm = try! Realm()
    
    func save(item: SecondCountryData) {
        try! realm.write{
            realm.add(item)
        }
    }
    
    func getItems() -> Results<SecondCountryData> {
        realm.objects(SecondCountryData.self)
    }
    
    func remove(item: SecondCountryData) {
        try! realm.write {
            realm.delete(item)
        }
    }
    
    func removeAll() {
        try! realm.write {
            for i in getItems() {
                realm.delete(i)
            }
        }
    }
}
    
    class FirstNumberPersistance {
        
        static let shared = FirstNumberPersistance()
        
        private let realm = try! Realm()
        
        func save(item: FirstNumberData) {
            try! realm.write{
                realm.add(item)
            }
        }
        
        func getItems() -> Results<FirstNumberData> {
            realm.objects(FirstNumberData.self)
        }
        
        func remove(item: FirstNumberData) {
            try! realm.write {
                realm.delete(item)
            }
        }
        
        func removeAll() {
            try! realm.write {
                for i in getItems() {
                    realm.delete(i)
                }
            }
        }
    }
    
    class SecondNumberPersistance {
        
        static let shared = SecondNumberPersistance()
        
        private let realm = try! Realm()
        
        func save(item: SecondNumberData) {
            try! realm.write{
                realm.add(item)
            }
        }
        
        func getItems() -> Results<SecondNumberData> {
            realm.objects(SecondNumberData.self)
        }
        
        func remove(item: SecondNumberData) {
            try! realm.write {
                realm.delete(item)
            }
        }
        
        func removeAll() {
            try! realm.write {
                for i in getItems() {
                    realm.delete(i)
                }
            }
        }
    }
