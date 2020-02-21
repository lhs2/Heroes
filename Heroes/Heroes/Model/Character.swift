//
//  Character.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - Character
struct Character: Codable {
    var id : Int?
    var name: String?
    var description: String?
    var modified: String?
    var resourceURI: String?
    var urls: [MarvelURL]?
    var thumbnail: MarvelImage?
    var comics: ComicList?
    var stories: StoryList?
    var events: EventList?
    var series: SeriesList?
    
    func getThumbnailPath()->String {
        guard let thumbnail = self.thumbnail,
            let path = thumbnail.path,
            let fileType = thumbnail.`extension` else { return String.Empty }
        return "\(path).\(fileType)"
    }
    
    
}
