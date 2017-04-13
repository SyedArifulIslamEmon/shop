//
//  Cart.swift
//  Shop
//
//  Created by Roland Michelberger on 13.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

class Cart {
    
    static let sharedInstance = Cart()
    
    private var countedSet = NSCountedSet()
    
    private init() {
    }
    
    func addProduct(product: Product) {
        countedSet.add(product)
    }
    
    func removeProduct(product: Product) {
        countedSet.remove(product)
    }
    
    var products : [Product] {
        get {
            return countedSet.allObjects as? [Product] ?? [Product]()
        }
    }
    
    var productCount: Int {
        get {
            return countedSet.count
        }
    }
    
    var totalCount: Int {
        get {
            var count = 0
            for product in products {
                count += countForProduct(product: product)
            }
            return count
        }
    }
    
    func countForProduct(product: Product) -> Int {
        return countedSet.count(for: product)
    }
}
