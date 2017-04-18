//
//  ShopUITests.swift
//  ShopUITests
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import XCTest

class ShopUITests: XCTestCase {
        
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShop() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let availableProducts = Product.availableProducts()
        let product1 = availableProducts[0]
        let product2 = availableProducts[1]
        
        // all availabble products should be visible in the shop
        XCTAssertEqual(app.tables.cells.count, UInt(availableProducts.count))

        // choose product1
        app.tables.cells.staticTexts[product1.name].tap()
        
        let steppersQuery = app.steppers
        let incrementButton = steppersQuery.buttons["Increment"]
        let decrementButton = steppersQuery.buttons["Decrement"]

        assertLabelExists(withText: "0")
        // add product1
        incrementButton.tap()
        assertLabelExists(withText: "1")
        // add product1
        incrementButton.tap()
        assertLabelExists(withText: "2")
        // add product1
        incrementButton.tap()
        assertLabelExists(withText: "3")
        // remove product1
        decrementButton.tap()
        assertLabelExists(withText: "2")

        
        // go back
        app.navigationBars[product1.name].buttons["Shop"].tap()
        
        
        // choose product2
        app.tables.cells.staticTexts[product2.name].tap()
        assertLabelExists(withText: "0")
        // add product2
        incrementButton.tap()
        assertLabelExists(withText: "1")
        // add product2
        incrementButton.tap()
        assertLabelExists(withText: "2")
        // remove product2
        decrementButton.tap()
        assertLabelExists(withText: "1")
        
        
        // go back
        app.navigationBars[product2.name].buttons["Shop"].tap()

        // open cart
        app.navigationBars["Shop"].buttons["cart icon"].tap()

        // there should be 2 products in the cart
        XCTAssertEqual(app.tables.cells.count, 2)

    }
    
    func assertLabelExists(withText text: String) {
        XCTAssert(app.staticTexts[text].exists)
    }
    
}
