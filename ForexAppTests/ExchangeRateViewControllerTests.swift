//
//  ExchangeRateViewControllerTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class ExchangeRateViewControllerTests: XCTestCase {
    
    var exchangeRateVC: ExchangeRateViewController!
    let homeVCTest = HomeViewControllerTests()
    let currencyVCTest = CurrencyConverterViewControllerTests()
    
    override func setUp() {
        exchangeRateVC = ExchangeRateViewController()
        let homeVC = HomeViewController()
        _ = UINavigationController(rootViewController: homeVC)
        //navController.pushViewController(currencyConverterVC, animated: true)
        _ = exchangeRateVC.view
    }
    
    func testWhenExchangeRateViewControllerLoadedThenOneLabelTwoTextFieldsAndOneButtonPresent(){
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: exchangeRateVC.view, labelText: "Exchange Rate Calculator"))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: exchangeRateVC.view, labelText: "Base Currency: "))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: exchangeRateVC.view, labelText: "Target Currencies: "))
        
        XCTAssertNotNil(currencyVCTest.findTextFieldsForView(view: exchangeRateVC.view, placeholder: "like EUR"))
        
        XCTAssertNotNil(currencyVCTest.findTextFieldsForView(view: exchangeRateVC.view, placeholder: "like INR,USD"))
        
        XCTAssertNotNil(homeVCTest.findButtonsForView(view: exchangeRateVC.view, buttonTittle: "Get Exchange Rates"))
    }
    
}
