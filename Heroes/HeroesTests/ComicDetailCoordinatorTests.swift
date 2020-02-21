//
//  ComicDetailCoordinator.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import Heroes

class ComicDetailCoordinatorTests: XCTestCase {

    func testComicDetailCoordinator() {
        let baseService = ComicDetailService()
        
        let comicDetailViewModel = ComicDetailViewModel.init(comicDetailService: baseService)
        
        let charList = self.loadCharacterListMock()
        if charList.count > 0, let charItem = charList.first {
            comicDetailViewModel.characterDetail = charItem
        }
        
        
        let comicDetailCoordinator = ComicDetailCoordinator.init(viewModel: comicDetailViewModel)
        
        comicDetailCoordinator.start()
        
        comicDetailViewModel.requestList()
        
        let comicList = self.loadComicListMock()
 
        comicDetailViewModel.setComicList(with: comicList)
        
    }

}
