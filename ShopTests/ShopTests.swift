//
//  ShopTests.swift
//  ShopTests
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import XCTest
@testable import Shop

class ShopTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCart() {
        let availableProducts = Product.availableProducts()
        
        // there should be 4 product
        XCTAssertEqual(availableProducts.count, 4)
        
        let product1 = availableProducts[0]
        let product2 = availableProducts[1]
        let products = [product1, product2]
        
        let accuracy = 0.001
        
        // cart should be empty
        XCTAssertEqual(Cart.shared.totalCount, 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, 0.0, accuracy: 0.001)

        // try to remove a product
        Cart.shared.remove(product1)
        XCTAssertEqual(Cart.shared.totalCount, 0)
        XCTAssertEqual(Cart.shared.productCount, 0)
        XCTAssertEqual(Cart.shared.count(for: product1), 0)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
        
        // add product1
        Cart.shared.add(product1)
        XCTAssertEqual(Cart.shared.totalCount, 1)
        XCTAssertEqual(Cart.shared.productCount, 1)
        XCTAssertEqual(Cart.shared.count(for: product1), 1)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
        
        // add product1
        Cart.shared.add(product1)
        XCTAssertEqual(Cart.shared.totalCount, 2)
        XCTAssertEqual(Cart.shared.productCount, 1)
        XCTAssertEqual(Cart.shared.count(for: product1), 2)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
       
        // add product2
        Cart.shared.add(product2)
        XCTAssertEqual(Cart.shared.totalCount, 3)
        XCTAssertEqual(Cart.shared.productCount, 2)
        XCTAssertEqual(Cart.shared.count(for: product1), 2)
        XCTAssertEqual(Cart.shared.count(for: product2), 1)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product1
        Cart.shared.remove(product1)
        XCTAssertEqual(Cart.shared.totalCount, 2)
        XCTAssertEqual(Cart.shared.productCount, 2)
        XCTAssertEqual(Cart.shared.count(for: product1), 1)
        XCTAssertEqual(Cart.shared.count(for: product2), 1)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product2
        Cart.shared.remove(product2)
        XCTAssertEqual(Cart.shared.totalCount, 1)
        XCTAssertEqual(Cart.shared.productCount, 1)
        XCTAssertEqual(Cart.shared.count(for: product1), 1)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
        
        // remove product2
        Cart.shared.remove(product2)
        XCTAssertEqual(Cart.shared.totalCount, 1)
        XCTAssertEqual(Cart.shared.productCount, 1)
        XCTAssertEqual(Cart.shared.count(for: product1), 1)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product1
        Cart.shared.remove(product1)
        XCTAssertEqual(Cart.shared.totalCount, 0)
        XCTAssertEqual(Cart.shared.productCount, 0)
        XCTAssertEqual(Cart.shared.count(for: product1), 0)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product1
        Cart.shared.remove(product1)
        XCTAssertEqual(Cart.shared.totalCount, 0)
        XCTAssertEqual(Cart.shared.productCount, 0)
        XCTAssertEqual(Cart.shared.count(for: product1), 0)
        XCTAssertEqual(Cart.shared.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(Cart.shared.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
    }
    
    func totalPrice(products: [Product]) -> Double {
        var totalPrice = 0.0
        for product in products {
            totalPrice += Double(Cart.shared.count(for: product)) * product.unitPrice.amount.doubleValue
        }
        return totalPrice
    }
    
}
