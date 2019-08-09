//
//  ForexHomeCoordinatorTests.swift
//  ForexAppTests
//
//  Created by Ford Labs on 08/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import ForexApp

class ForexHomeCoordinatorTests: XCTestCase {

    var forexHomeCoordinator: ForexHomeCoordinator!
    var mockNavController: MockNavigationController!
    
    override func setUp() {
        mockNavController = MockNavigationController()
        forexHomeCoordinator = ForexHomeCoordinator(navController: mockNavController)
    }

    func test_WhenForexCoordinatorStartMethodCalled_ThenShouldShowHomeViewController(){
        forexHomeCoordinator.start()
        
        XCTAssert(self.mockNavController.topViewController?.isKind(of: HomeViewController.self) ?? false)
    }
}
