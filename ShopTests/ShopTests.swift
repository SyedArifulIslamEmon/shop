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
        let products = Product.availableProducts()
        
        // there should be 4 product
        XCTAssertEqual(products.count, 4)
        
        let product1 = products[0]
        let product2 = products[1]
        
        // cart should be empty
        XCTAssertEqual(Cart.sharedInstance.totalCount, 0)

        // try to remove a product
        Cart.sharedInstance.removeProduct(product: product1)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 0)
        XCTAssertEqual(Cart.sharedInstance.productCount, 0)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 0)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)
        
        // add product1
        Cart.sharedInstance.addProduct(product: product1)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 1)
        XCTAssertEqual(Cart.sharedInstance.productCount, 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)
        
        // add product1
        Cart.sharedInstance.addProduct(product: product1)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 2)
        XCTAssertEqual(Cart.sharedInstance.productCount, 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 2)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)
       
        // add product2
        Cart.sharedInstance.addProduct(product: product2)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 3)
        XCTAssertEqual(Cart.sharedInstance.productCount, 2)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 2)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 1)

        // remove product1
        Cart.sharedInstance.removeProduct(product: product1)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 2)
        XCTAssertEqual(Cart.sharedInstance.productCount, 2)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 1)

        // remove product2
        Cart.sharedInstance.removeProduct(product: product2)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 1)
        XCTAssertEqual(Cart.sharedInstance.productCount, 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)
        
        // remove product2
        Cart.sharedInstance.removeProduct(product: product2)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 1)
        XCTAssertEqual(Cart.sharedInstance.productCount, 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 1)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)

        // remove product1
        Cart.sharedInstance.removeProduct(product: product1)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 0)
        XCTAssertEqual(Cart.sharedInstance.productCount, 0)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 0)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)

        // remove product1
        Cart.sharedInstance.removeProduct(product: product1)
        XCTAssertEqual(Cart.sharedInstance.totalCount, 0)
        XCTAssertEqual(Cart.sharedInstance.productCount, 0)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product1), 0)
        XCTAssertEqual(Cart.sharedInstance.countForProduct(product: product2), 0)
    }
    
}
