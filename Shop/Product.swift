//
//  Product.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

struct Product {
    
    let id: String
    let name: String
    let description: String
    let unit : Unit
    let unitPrice: Price
    
}


extension Product {
    
    static func availableProducts() -> [Product] {
        var products = [Product]()
        
        // Peas : $ 0,95 per bag
        let peas = Product(id: "id", name: "Peas", description: "Peas description", unit: .Bag, unitPrice: Price(amount: 0.95, currency: .USD))
        products.append(peas)
        
        
        // Eggs : $ 2,10 per dozen
        let eggs = Product(id: "id", name: "Eggs", description: "Eggs description 🥚🥚🥚🥚🥚🥚🥚🥚🥚🥚🥚🥚", unit: .Dozen, unitPrice: Price(amount: 2.10, currency: .USD))
        products.append(eggs)
        
        // Milk : $ 1,30 per bottle
        let milk = Product(id: "id", name: "Milk", description: "Milk description 🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛🥛", unit: .Bottle, unitPrice: Price(amount: 1.3, currency: .USD))
        products.append(milk)
        
        // Beans : $ 0,73 per can
        let beans = Product(id: "id", name: "Beans", description: "Beans description", unit: .Can, unitPrice: Price(amount: 0.73, currency: .USD))
        products.append(beans)
        
        return products
    }
    
}

extension NumberFormatter {
    
    func productUnitPriceString(product: Product) -> String {
        let priceString = string(from: product.unitPrice)
        return "\(priceString ?? "0") / \(product.unit.rawValue)"
    }
}
