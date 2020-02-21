//
//  XCTestCase+Mock.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

import XCTest
@testable import Heroes

extension XCTestCase {
    func loadComicListMock() -> [Comic] {
        guard let url = Bundle.main.url(forResource: "Comic", withExtension: "json") else {
            XCTFail("Missing file: Comic.json")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let comicData = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
            guard let comicResult = comicData.data,
                let comicList = comicResult.results else {
                    XCTFail("Missing Comic List")
                    return []
            }
            XCTAssertTrue(comicList.count > 0)
            
            return comicList
        } catch {
            XCTFail("Failed in parsing File with: \(error.localizedDescription)")
        }
        return []
    }
    
    func loadCharacterListMock() -> [Character] {
        guard let url = Bundle.main.url(forResource: "Char", withExtension: "json") else {
            XCTFail("Missing file: Char.json")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let charData = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
            guard let charResult = charData.data,
                let charList = charResult.results else {
                    XCTFail("Missing Character List")
                    return []
            }
            XCTAssertTrue(charList.count > 0)
            
            return charList
        } catch {
            XCTFail("Failed in parsing File with: \(error.localizedDescription)")
        }
        return []
    }
}
