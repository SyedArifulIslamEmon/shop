//
//  CountedSet.swift
//  Shop
//
//  Created by Roland Michelberger on 14.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

class CountedSet<Element> where Element: Hashable {
    
    let set = Set<Element>()
    
    let countedSet = NSCountedSet()
    
    open func add(_ object: Element) {
        countedSet.add(object)
    }
    
    open func remove(_ object: Element) {
        countedSet.remove(object)
    }
    
    open func count(for object: Element) -> Int {
        return countedSet.count(for: object)
    }
    
    open var count: Int {
        get {
            return countedSet.count
        }
    }
    
    open var allObjects: [Element] { get {
        return countedSet.allObjects as? [Element] ?? [Element]()
        }
    }
    
    open func anyObject() -> Element? {
        return countedSet.anyObject() as? Element
    }
    
    open func contains(_ anObject: Element) -> Bool {
        return countedSet.contains(anObject)
    }

}
