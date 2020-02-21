//
//  HeroesTests.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import Heroes

class HeroesTests: XCTestCase {

    func testMockCharacter() {
        let charList = self.loadCharacterListMock()
        XCTAssertNotNil(charList)
        
        var charItem = charList.first
        XCTAssertNotNil(charItem)
        
        var path = charItem?.getThumbnailPath() ?? String.Empty
        XCTAssert(path.isEmpty)
        
        XCTAssert(charList.count > 2)
        charItem = charList[1]
        path = charItem?.getThumbnailPath() ?? String.Empty
        XCTAssert(!path.isEmpty)
    }
    
    func testMockComic() {
        let comicList = self.loadComicListMock()
        XCTAssertNotNil(comicList)
        
        var comicItem = comicList.first
        XCTAssertNotNil(comicItem)
        
        var path = comicItem?.getFirstImageAvailable() ?? String.Empty
        XCTAssert(path.isEmpty)
        
        XCTAssert(comicList.count > 2)
        comicItem = comicList[1]
        path = comicItem?.getFirstImageAvailable() ?? String.Empty
        XCTAssert(!path.isEmpty)
    }


}
