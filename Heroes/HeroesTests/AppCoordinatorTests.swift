//
//  AppCoordinatorTests.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import Heroes

class AppCoordinatorTests: XCTestCase {

    func testAppCoordinator() {
        let appCoordinator = AppCoordinator.init()
        appCoordinator.start()
        
    }
}
