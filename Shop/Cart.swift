//
//  Cart.swift
//  Shop
//
//  Created by Roland Michelberger on 13.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

class Cart {
    
    static let shared = Cart()
    
    private var countedSet = CountedSet<Product>()
    
    private init() {
    }
    
    func add(product: Product) {
        countedSet.add(product)
    }
    
    func remove(product: Product) {
        countedSet.remove(product)
    }
    
    var products : [Product] {
        get {
            return countedSet.allObjects
        }
    }
    
    var productCount: Int {
        get {
            return countedSet.count
        }
    }

    func count(for product: Product) -> Int {
        return countedSet.count(for: product)
    }

    var totalCount: Int {
        get {
            var totalCount = 0
            for product in products {
                totalCount += count(for: product)
            }
            return totalCount
        }
    }
    
    var totalPrice : Price {
        get {
            var amount = NSDecimalNumber(string: "0")
            for product in products {
                let productCount = count(for: product)
                amount = amount.adding(product.unitPrice.amount.multiplying(by: NSDecimalNumber(string: "\(productCount)")))
            }
            return Price(amount: amount, currency: .USD)
        }
    }
    
}
