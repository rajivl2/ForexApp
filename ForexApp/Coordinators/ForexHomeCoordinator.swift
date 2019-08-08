//
//  ForexHomeCoordinator.swift
//  ForexApp
//
//  Created by Ford Labs on 08/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit

class ForexHomeCoordinator {
    let homeVC = HomeViewController()
    let navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        self.homeVC.homeVCDelegate = self
        self.navigationController.pushViewController(homeVC, animated: true)
    }
}

extension ForexHomeCoordinator : HomeViewControllerDelegate {
    func currencyConverterButtonTapped() {
        let currncyConverterVC = CurrencyConverterViewController()
        currncyConverterVC.getSupportedCurresciesForPicker()
        self.navigationController.pushViewController(currncyConverterVC, animated: true)
    }
    
    func currencyRateCalculatorButtonTapped() {
        let exchangeRateVC = ExchangeRateViewController()
        self.navigationController.pushViewController(exchangeRateVC, animated: true)
    }
    
    
}
