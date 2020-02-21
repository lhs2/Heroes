//
//  TextObject.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - TextObject
struct TextObject: Codable {
    var type: String?
    var language: String?
    var text: String?
}
