//
//  DetailCoordinator.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import Heroes

class DetailCoordinatorTests: XCTestCase {

    func testDetailCoordinator() {
        
        let detailViewModel = DetailViewModel.init()
        let charList = self.loadCharacterListMock()
        if charList.count > 0, let charItem = charList.first {
            detailViewModel.characterDetail = charItem
        }

        
        let detailCoordinator = DetailCoordinator(viewModel: detailViewModel)
        
        detailCoordinator.start()
        detailViewModel.showExpensiveComic()
        
    }

}
