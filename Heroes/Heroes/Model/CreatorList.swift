//
//  CreatorList.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - Comic
struct CreatorList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [CreatorSummary]?
}
