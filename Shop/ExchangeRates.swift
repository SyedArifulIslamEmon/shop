//
//  ExchangeRates.swift
//  Shop
//
//  Created by Roland Michelberger on 16.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

struct ExchangeRates {
    
    let source: Currency
    let quotes: [ExchangeRate]
    
//    init(source: Currency, quotes: [ExchangeRate]) {
//        self.source = source
//        self.quotes = quotes
//    }
    
    init? (dict: [String: AnyObject]) {
        
        // if source not found
        guard let sourceString = dict["source"] as? String else {
            return nil
        }
        
        self.source = Currency(string: sourceString)
        
        // if quotes not found
        guard let quotesDict = dict["quotes"] as? [String: AnyObject] else {
            return nil
        }
        
        var quotes = [ExchangeRate]()
        
        for key in quotesDict.keys {
            
            // remove source currency string
            // e.g. "USDEUR" -> "EUR"
            let currencyString = key.replacingOccurrences(of: source.rawValue, with: "")

            // skip source currency
            guard !currencyString.isEmpty else {
                continue
            }
            
            // add exchange rate to quotes
            let currency = Currency(string: currencyString)
            if let rate = quotesDict[key]?.doubleValue {
                let exchangeRate = ExchangeRate(from: source, to: currency, rate: rate)
                quotes.append(exchangeRate)
            }
        }
        
        self.quotes = quotes
    }
}
