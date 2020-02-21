//
//  Date.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

extension Date {
    static var timestamp: Int64{
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}
