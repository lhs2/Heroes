//
//  SeriesList.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - SeriesList
struct SeriesList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [SeriesSummary]?
}
