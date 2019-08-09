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
    var mockNavigationController: UINavigationController!
    var exchangeRateCoordinator: ExchangeRateCoordinator!
    
    override func setUp() {
        exchangeRateVC = ExchangeRateViewController()
        mockNavigationController = MockNavigationController()
        exchangeRateCoordinator = ExchangeRateCoordinator(navigationController: mockNavigationController)
        exchangeRateVC.delegate = exchangeRateCoordinator
        _ = exchangeRateVC.view
    }
    
    func test_WhenExchangeRateViewControllerLoaded_ThenOneLabelTwoTextFieldsAndOneButtonPresent(){
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: exchangeRateVC.view, labelText: "Exchange Rate Calculator"))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: exchangeRateVC.view, labelText: "Base Currency: "))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: exchangeRateVC.view, labelText: "Target Currencies: "))
        
        XCTAssertNotNil(currencyVCTest.findTextFieldsForView(view: exchangeRateVC.view, placeholder: "like EUR"))
        
        XCTAssertNotNil(currencyVCTest.findTextFieldsForView(view: exchangeRateVC.view, placeholder: "like INR,USD"))
        
        XCTAssertNotNil(homeVCTest.findButtonsForView(view: exchangeRateVC.view, buttonTittle: "Get Exchange Rates"))
    }
    
    func test_GivenExchangeViewController_WhenGetExchangeRatesButtonTapped_ThenShouldDisplayTableViewController (){
        
        exchangeRateCoordinator.start()
        
        let exchangeRatebutton = homeVCTest.findButtonsForView(view: exchangeRateVC.view, buttonTittle: "Get Exchange Rates")
        
        let fromCurrencyText = currencyVCTest.findTextFieldsForView(view: exchangeRateVC.view, placeholder: "like EUR")
        
        fromCurrencyText?.text = "EUR"
        
        let toCurrencyText = currencyVCTest.findTextFieldsForView(view: exchangeRateVC.view, placeholder: "like INR,USD")
        
        toCurrencyText?.text = "INR"
        
        exchangeRatebutton?.sendActions(for: .touchUpInside)
        
        XCTAssertNotNil(mockNavigationController.topViewController as? ExchangeResultTableViewController)
    }
    
}
