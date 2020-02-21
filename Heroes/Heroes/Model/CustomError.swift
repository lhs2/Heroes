//
//  CustomError.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
//MARK: - CustomError
public struct CustomError : Error {
    public enum CustomErrorType {
        case serviceError
        case unknownError
        case connectionError
        case invalidRequest
        case notFound
        case parserError
    }
    
    init(with type: CustomErrorType = .serviceError, describing: String = "Service Error") {
        self.localizedDescription = describing
        self.errorType = type
    }

    init(_ error: Error, type: CustomErrorType = .notFound) {
        self.localizedDescription = error.localizedDescription
        self.errorType = type
    }

    init(with type: CustomErrorType = .notFound) {
        self.errorType = type
    }
    //Static versions
    
    var localizedDescription: String = ""
    var errorType: CustomErrorType = .notFound

    func description()->String {
        switch self.errorType {
        case .serviceError:
            return self.localizedDescription
        case .unknownError:
            return "An unknown error occurred. Try again later."
        case .connectionError:
            return "An connection error occurred. Try again later."
        case .invalidRequest:
            return "An internal error occurred. Try again later."
        case .notFound:
            return "An unknown error occurred. Try again later"
        case .parserError:
            return "An parser error occurred. Try again later"
        }
    }
}
