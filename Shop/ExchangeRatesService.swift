//
//  ExchangeRatesService.swift
//  Shop
//
//  Created by Roland Michelberger on 16.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

class ExchangeRatesService {
    
    static let ERROR_DOMAIN = "roland.michelberger.shop.PriceConverter"
    
    static let NO_RESPONSE_DATA_RECEIVED = -1
    static let NO_RATE_RECEIVED = -2
    
    class func exchangeRates(fromSource currency: Currency, completion: @escaping (_ exchangeRates: ExchangeRates?, _ error: Error?) -> Void) {
        let urlString = "\(Constants.CURRENCY_LAYER_BASE_URL)/api/live?access_key=\(Constants.CURRENCY_LAYER_API_KEY)&source=\(currency.rawValue)"
        if let url = URL(string: urlString) {
            let _ = DataService.getData(from: url, completion: { (data, response, error) in
                if let _ = error {
                    completion(nil, error)
                } else if let data = data {
                    let result = JSONParser.exchangeRatesFromJSON(data:data)
                    
                    if let _ = result.error {
                        completion(nil,result.error)
                    } else if let _ = result.exchangeRates {
                        completion(result.exchangeRates, nil)
                    } else {
                        completion(nil, NSError(domain: ERROR_DOMAIN, code: NO_RATE_RECEIVED, userInfo: [NSLocalizedDescriptionKey : "No exchange rates received."]))
                    }
                } else {
                    completion(nil,NSError(domain: ERROR_DOMAIN, code: NO_RESPONSE_DATA_RECEIVED, userInfo: [NSLocalizedDescriptionKey : "No response data received."]))
                }
                
            })
        }
    }
}
