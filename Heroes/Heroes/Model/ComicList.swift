//
//  ComicList.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - ComicList
struct ComicList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var itens: [ComicSummary]?
}
