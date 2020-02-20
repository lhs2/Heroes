//
//  BaseService.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation


import Foundation
import UIKit

protocol ServiceProtocol: AnyObject {
    @discardableResult
    func get<T: Codable>(completion: @escaping (T?, CustomError?) -> Void) -> T?

}

class BaseService: ServiceProtocol {
    func get<T>(completion: @escaping (T?, CustomError?) -> Void) -> T? where T : Codable {
        fatalError("Not implemented Get from \(#function)")
    }
    

    

}
