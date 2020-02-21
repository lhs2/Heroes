//
//  HomeCoordinatorTests.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import Heroes

class HomeCoordinatorTests: XCTestCase {

    func testHomeCoordinator() {
        let baseService = HomeService()
        
        let homeViewModel = HomeViewModel.init(homeService: baseService)
        homeViewModel.setCharacterList(with: self.loadCharacterListMock())
        
        
        let homeCoordinator = HomeCoordinator.init(viewModel: homeViewModel)
        
        homeCoordinator.start()
        
        homeViewModel.setSelectedItem(by: 0)
        
    }

}
