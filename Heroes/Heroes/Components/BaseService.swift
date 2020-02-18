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

protocol Service: AnyObject {
    
    func get<T>(completion: @escaping (T?, CustomError?) -> Void) where T: Codable

}

class BaseService: Service {
    func get<T>(completion: @escaping (T?, CustomError?) -> Void) where T : Codable {
        fatalError("Not implemented Get from \(#function)")
    }
    

    

}
