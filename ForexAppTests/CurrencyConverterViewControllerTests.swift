//
//  CurrencyConverterViewControllerTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 07/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class CurrencyConverterViewControllerTests: XCTestCase {

    var currencyConverterVC: CurrencyConverterViewController!
    let homeVCTest = HomeViewControllerTests()
    
    override func setUp() {
        currencyConverterVC = CurrencyConverterViewController()
        let homeVC = HomeViewController()
        _ = UINavigationController(rootViewController: homeVC)
        //navController.pushViewController(currencyConverterVC, animated: true)
        _ = currencyConverterVC.view
    }

    func testWhenCurrencyConverterViewControllerLoadedThenOneLabelThreeTextFieldsAndOneButtonPresent(){
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: currencyConverterVC.view, labelText: "Currency Converter"))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: currencyConverterVC.view, labelText: "From "))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: currencyConverterVC.view, labelText: "To "))
        
        XCTAssertNotNil(homeVCTest.findLabelsForView(view: currencyConverterVC.view, labelText: "Amount "))
        
        XCTAssertNotNil(findTextFieldsForView(view: currencyConverterVC.view, placeholder: "Enter base currency"))
        
        XCTAssertNotNil(findTextFieldsForView(view: currencyConverterVC.view, placeholder: "Enter desired currency"))
        
        XCTAssertNotNil(findTextFieldsForView(view: currencyConverterVC.view, placeholder: "Enter Amount"))
        
        XCTAssertNotNil(homeVCTest.findButtonsForView(view: currencyConverterVC.view, buttonTittle: "Convert"))
    }

    func findTextFieldsForView(view: UIView, placeholder: String) -> UITextField?{
        for subview in view.subviews{
            if let textField = subview as? UITextField, textField.placeholder == placeholder {
                return textField
            }
        }
        return nil
    }
}
