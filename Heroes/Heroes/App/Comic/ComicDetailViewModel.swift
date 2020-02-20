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
        return bestComic
    }
    
    private func getMostExpensivePrice(with priceList: [ComicPrice]) -> Float {
        var bestPrice: Float = 0.0
        for prices in priceList {
            if let cost = prices.price, bestPrice < cost {
                bestPrice = cost
            }
        }
        return bestPrice
    }
    
    private func setExpensiveComic(with comic: Comic) {
        expensiveComic = comic
    }
}
