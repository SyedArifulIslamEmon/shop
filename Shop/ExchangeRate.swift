//
//  ExchangeRate.swift
//  Shop
//
//  Created by Roland Michelberger on 16.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

struct ExchangeRate {
    
    let from: Currency
    let to: Currency
    let rate: Double
    
    init(from: Currency, to: Currency, rate: Double) {
        self.from = from
        self.to = to
        self.rate = rate
    }
    
//    init?(dict: [String: AnyObject]) {
//        if let from = dict["from"] as? String,
//            let to = dict["to"] as? String,
//            let rate = dict["rate"] as? NSString {
//            self.from = Currency(string: from)
//            self.to = Currency(string: to)
//            self.rate = rate.doubleValue
//        }  else {
//            return nil
//        }
//    }
}
