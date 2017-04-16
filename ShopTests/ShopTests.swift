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
    
    let cart = Cart(currency: .USD)

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
        XCTAssertEqual(cart.totalCount, 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, 0.0, accuracy: 0.001)

        // try to remove a product
        cart.remove(product1)
        XCTAssertEqual(cart.totalCount, 0)
        XCTAssertEqual(cart.productCount, 0)
        XCTAssertEqual(cart.count(for: product1), 0)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
        
        // add product1
        cart.add(product1)
        XCTAssertEqual(cart.totalCount, 1)
        XCTAssertEqual(cart.productCount, 1)
        XCTAssertEqual(cart.count(for: product1), 1)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
        
        // add product1
        cart.add(product1)
        XCTAssertEqual(cart.totalCount, 2)
        XCTAssertEqual(cart.productCount, 1)
        XCTAssertEqual(cart.count(for: product1), 2)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
       
        // add product2
        cart.add(product2)
        XCTAssertEqual(cart.totalCount, 3)
        XCTAssertEqual(cart.productCount, 2)
        XCTAssertEqual(cart.count(for: product1), 2)
        XCTAssertEqual(cart.count(for: product2), 1)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product1
        cart.remove(product1)
        XCTAssertEqual(cart.totalCount, 2)
        XCTAssertEqual(cart.productCount, 2)
        XCTAssertEqual(cart.count(for: product1), 1)
        XCTAssertEqual(cart.count(for: product2), 1)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product2
        cart.remove(product2)
        XCTAssertEqual(cart.totalCount, 1)
        XCTAssertEqual(cart.productCount, 1)
        XCTAssertEqual(cart.count(for: product1), 1)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
        
        // remove product2
        cart.remove(product2)
        XCTAssertEqual(cart.totalCount, 1)
        XCTAssertEqual(cart.productCount, 1)
        XCTAssertEqual(cart.count(for: product1), 1)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product1
        cart.remove(product1)
        XCTAssertEqual(cart.totalCount, 0)
        XCTAssertEqual(cart.productCount, 0)
        XCTAssertEqual(cart.count(for: product1), 0)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)

        // remove product1
        cart.remove(product1)
        XCTAssertEqual(cart.totalCount, 0)
        XCTAssertEqual(cart.productCount, 0)
        XCTAssertEqual(cart.count(for: product1), 0)
        XCTAssertEqual(cart.count(for: product2), 0)
        XCTAssertEqualWithAccuracy(cart.totalPrice.amount.doubleValue, totalPrice(products: products), accuracy: accuracy)
    }
    
    func totalPrice(products: [Product]) -> Double {
        var totalPrice = 0.0
        for product in products {
            totalPrice += Double(cart.count(for: product)) * product.unitPrice.amount.doubleValue
        }
        return totalPrice
    }
    
}
