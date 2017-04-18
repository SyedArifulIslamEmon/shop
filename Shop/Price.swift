//
//  Price.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

struct Price {
    
    let amount : NSDecimalNumber
    let currency : Currency
    
    init (amount: NSDecimalNumber, currencyString : String) {
        self.amount = amount
        self.currency = Currency(string: currencyString)
    }
    
    init (amount: NSDecimalNumber, currency : Currency) {
        self.amount = amount
        self.currency = currency
    }
}


extension NumberFormatter {
    
    func string(from price: Price) -> String? {
        self.numberStyle = .currencyAccounting
        self.currencyCode = price.currency.rawValue
        return string(from: price.amount)
    }
}
