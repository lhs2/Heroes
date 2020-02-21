//
//  ComicDetailViewModel.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class ComicDetailViewModel {
    
    let service: BaseService
    var characterDetail: Character?
    private var comicList: [Comic] = [] {
        didSet {
            searchAndSetExpensiveComic()
        }
    }
    private var expensiveComic : Comic? {
        didSet {
            self.isSuccess.value = true
            self.isLoading.value = false
        }
    }
    
    private var expensivePrice: Float = 0.0
    
    //MARK: - UI Information
    var characterImagePath: String {
        guard let comic = expensiveComic else {
            return String.Empty
        }
        let imagePath = comic.getFirstImageAvailable()
        return imagePath
    }
    
    var characterDescription: String {
        guard let character = characterDetail else {
            return "No description found"
        }
        if let description = character.description, !description.isEmpty {
            return description
        }
        
        return "No description found"
    }
    
    var characterName: String {
        guard let character = characterDetail else {
            return "USD:\(expensivePrice) - No name found"
        }
        if let name = character.name, !name.isEmpty {
            return "USD:\(expensivePrice) - \(name)"
            
        }
        return "USD:\(expensivePrice) - No name found"
    }
    
    //MARK: - Binding
    let isSuccess : Variable<Bool> = Variable(false)
    let isLoading : Variable<Bool> = Variable(false)
    let errorMsg  : Variable<String> = Variable(String.Empty)
    
    init(comicDetailService: BaseService) {
        service = comicDetailService
    }
    
    func requestList() {
        isLoading.value = true
        
        if let comicDetailService = service as? ComicDetailService,
            let character = characterDetail,
            let characterID = character.id {
            comicDetailService.updateID(to: characterID)
        }
        
        let _ : ComicDataWrapper? = service.get(){
            responseSuccess , responseError in
            if let error = responseError {
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value = error.description()
            }
            if let marvelResponse =  responseSuccess,
                let marvelResponseData = marvelResponse.data,
                let comicResponseList = marvelResponseData.results {
                // persist info
                self.setComicList(with: comicResponseList)
                
            }
            else {
                let parseError = CustomError(with: .parserError)
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value =  parseError.description()
            }
        }
        
    }
    
    func setComicList(with comicResponseList: [Comic]) {
        self.comicList.append(contentsOf: comicResponseList)
    }
    
    func searchAndSetExpensiveComic() {

        guard comicList.count > 0,
            let comic: Comic = searchExpensiveComic()
            else {
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value =  "No comic available for this character"
                return
        }
        
        setExpensiveComic(with: comic)
        
    }
    
    private func searchExpensiveComic() -> Comic? {
        var bestComic: Comic = Comic()
        var bestMaxPrice: Float = 0.0
        for comic in comicList {
            if let priceList = comic.prices, priceList.count > 0 {
                let price = getMostExpensivePrice(with: priceList)
                if price > bestMaxPrice {
                    bestComic = comic
                    bestMaxPrice = price
                }
            }
        }
        expensivePrice = bestMaxPrice
        return bestComic
    }
    
    private func getMostExpensivePrice(with priceList: [ComicPrice]) -> Float {
        var bestPrice: Float = 0.0
        for prices in priceList {
            if let cost = prices.price, cost > bestPrice {
                bestPrice = cost
            }
        }
        return bestPrice
    }
    
    private func setExpensiveComic(with comic: Comic) {
        expensiveComic = comic
    }
}
