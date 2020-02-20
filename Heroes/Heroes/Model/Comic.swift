//
//  Comic.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - Comic
struct Comic: Codable {
    var id : Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Double?
    var variantDescription: String?
    var description: String?
    var modified: String?
    var isbn: String?
    var upc: String?
    var diamondCode: String?
    var ean: String?
    var issn: String?
    var format: String?
    var pageCount: Int?
    var textObjects: [TextObject]?
    var resourceURI: String?
    var urls: [MarvelURL]?
    var series: SeriesSummary?
    var variants: [ComicSummary]?
    var collections: [ComicSummary]?
    var collectedIssues: [ComicSummary]?
    var dates: [ComicDate]?
    var prices: [ComicPrice]?
    var thumbnail: MarvelImage?
    var images: [MarvelImage]?
    var creators: CreatorList?
    var characters: CharacterList?
    var stories: StoryList?
    var events: EventList?
    
    func getThumbnailPath()->String {
        guard let thumbnail = self.thumbnail,
            let path = thumbnail.path,
            let fileType = thumbnail.`extension` else { return String.Empty }
        return "\(path).\(fileType)"
    }
    
    func getFirstImageAvailable()->String {
        
        guard let imageList = images,  imageList.count > 0,
            let firstImage = imageList.first,
            let path = firstImage.path,
            let fileType = firstImage.extension
            else { return self.getThumbnailPath() }
        return "\(path).\(fileType)"
    }
    
}
