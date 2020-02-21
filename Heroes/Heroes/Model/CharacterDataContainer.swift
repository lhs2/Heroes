//
//  ComicDataContainer.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - ComicDataContainer
struct CharacterDataContainer: Codable {
    var offset : Int?
    var limit : Int?
    var total : Int?
    var count : Int?
    var results : [Character]?


}
