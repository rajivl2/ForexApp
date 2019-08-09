//
//  ExchangeRateCoordinator.swift
//  ForexApp
//
//  Created by Ford Labs on 09/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit

class ExchangeRateCoordinator : Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        let exchangeRateVC = ExchangeRateViewController()
        exchangeRateVC.delegate = self
        self.navigationController.pushViewController(exchangeRateVC, animated: true)
    }
}

extension ExchangeRateCoordinator: ExchangeRateViewControllerDelegate {
    func exchangeRateButtonTapped(fromCurrency: String, toCurrencies: String) {
        let tableVC = ExchangeResultTableViewController(fromCurrency: fromCurrency, toCurrencies: toCurrencies)
        self.navigationController.pushViewController(tableVC, animated: true)
    }
    
    
}
