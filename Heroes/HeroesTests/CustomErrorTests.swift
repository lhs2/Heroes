//
//  CustomErrorTests.swift
//  HeroesTests
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import Heroes

class CustomErrorTests: XCTestCase {

    func testErrorUnknown() {
        let err = CustomError.init(with: .unknownError)
        XCTAssertNotNil(err.description())
    }
    
    func testErrorConnection() {
        let err = CustomError.init(with: .connectionError)
        XCTAssertNotNil(err.description())
    }
    
    func testErrorInvalid() {
        let err = CustomError.init(with: .invalidRequest)
        XCTAssertNotNil(err.description())
    }
    
    func testErrorNotFound() {
        let err = CustomError.init(with: .notFound)
        XCTAssertNotNil(err.description())
    }
    
    
    func testErrorParse() {
        let err = CustomError.init(with: .parserError)
        XCTAssertNotNil(err.description())
    }
    
    func testErrorImage() {
        let err = CustomError.init(with: .serviceError, describing: "CustomError")
        XCTAssertEqual(err.description(), "CustomError")
    }

}
