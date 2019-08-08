//
//  HomeViewControllerTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 06/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class HomeViewControllerTests: XCTestCase {

    var homeVC: HomeViewController!
    var forexAppCoordinator: ForexHomeCoordinator!
    var mockNavigationController: MockNavigationController!
    
    override func setUp() {
        
        homeVC = HomeViewController()
        
        mockNavigationController = MockNavigationController()
        forexAppCoordinator = ForexHomeCoordinator(navController: mockNavigationController)
        homeVC.homeVCDelegate = forexAppCoordinator
        
        _ = homeVC.view
    }
    
    func testWhenHomeControllerLoadedThenOneLabelAndTwoButtonPresent(){
        
        let appName = findLabelsForView(view: homeVC.view, labelText: "FOREX")
        
        XCTAssertNotNil(appName)
        
        let currencyConverterButton = findButtonsForView(view: homeVC.view, buttonTittle: "Currency Converter")
        
        XCTAssertNotNil(currencyConverterButton)
        
        let exchangeRateCalculatorButton = findButtonsForView(view: homeVC.view, buttonTittle: "Exchange Rate Calculator")
        
        XCTAssertNotNil(exchangeRateCalculatorButton)
        
    }
    
    func testGivenHomeViewControllerWhenButtonTappedThenNavigateToCurrencyViewController(){
        
        let currencyConverterButton = findButtonsForView(view: homeVC.view, buttonTittle: "Currency Converter")
        currencyConverterButton?.sendActions(for: .touchUpInside)
        
        XCTAssertNotNil(mockNavigationController.topViewController as? CurrencyConverterViewController)
        
        let exchangeRateCalculatorButton = findButtonsForView(view: homeVC.view, buttonTittle: "Exchange Rate Calculator")
        exchangeRateCalculatorButton?.sendActions(for: .touchUpInside)
        
        XCTAssertNotNil(mockNavigationController.topViewController as? ExchangeRateViewController)
        
        
    }
    
    func findLabelsForView(view: UIView, labelText: String) -> UILabel?{
        for subview in view.subviews{
            if let label = subview as? UILabel, label.text == labelText {
                return label
            }
        }
        return nil
    }
    
    func findButtonsForView(view: UIView, buttonTittle: String) -> UIButton?{
        for subview in view.subviews{
            if let button = subview as? UIButton, button.currentTitle == buttonTittle {
                return button
            }
        }
        return nil
    }
}

class MockNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }

}
