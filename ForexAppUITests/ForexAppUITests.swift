//
//  ForexAppUITests.swift
//  ForexAppUITests
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest

class ForexAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPageElements(){
        
        let app = XCUIApplication()
        let appName = app.staticTexts["FOREX"]
        XCTAssertTrue(appName.exists)
        
        let currencyConverterButton = app.buttons["Currency Converter"]
        let exchangeRateCalculatorButton = app.buttons["Exchange Rate Calculator"]
        
        XCTAssertTrue(currencyConverterButton.exists)
        XCTAssertTrue(exchangeRateCalculatorButton.exists)
        
        currencyConverterButton.tap()
        let currencyConverterLabel = app.staticTexts["Currency Converter"]
        let fromCurrencyLabel = app.staticTexts["From "]
        let toLabel = app.staticTexts["To "]
        let amountLabel = app.staticTexts["Amount "]
        
        XCTAssertTrue(currencyConverterLabel.exists)
        XCTAssertTrue(fromCurrencyLabel.exists)
        XCTAssertTrue(toLabel.exists)
        XCTAssertTrue(amountLabel.exists)
        
        let backButton = app.navigationBars["ForexApp.CurrencyConverterView"].buttons["Back"]
        backButton.tap()
        
        exchangeRateCalculatorButton.tap()
        
        let exchangeRateTittle = app.staticTexts["Exchange Rate Calculator"]
        let baseCurrencyLabel = app.staticTexts["Base Currency: "]
        let targetCurrencyLabel = app.staticTexts["Target Currencies:  "]
        
        XCTAssertTrue(exchangeRateTittle.exists)
        XCTAssertTrue(baseCurrencyLabel.exists)
        XCTAssertTrue(targetCurrencyLabel.exists)
        
    }
}
