//
//  ForexHomeCoordinator.swift
//  ForexApp
//
//  Created by Ford Labs on 08/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit

class ForexHomeCoordinator : Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let homeVC = HomeViewController()
    let navigationController: UINavigationController
    var exchangeRateCoordinator: ExchangeRateCoordinator!
    
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
        exchangeRateCoordinator = ExchangeRateCoordinator(navigationController: navigationController)
        startChildCoordinator(coordinator: exchangeRateCoordinator)
    }
    
    func startChildCoordinator(coordinator: Coordinator){
        childCoordinators.removeAll()
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
