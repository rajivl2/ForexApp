//
//  Coordinator.swift
//  ForexApp
//
//  Created by Ford Labs on 09/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get }
    
    func start()
    
    var childCoordinators: [Coordinator] { get }
    
}
