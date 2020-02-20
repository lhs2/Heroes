//
//  HomeViewModel.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewModel {
    let service: BaseService
    private var characterList: [Character] = []
    
    var selectedCharacter: Character?
    
    var rows: Int {
        return characterList.count
    }
    
    let didSelectedRow = PublishSubject<Void>()
    
    let isSuccess : Variable<Bool> = Variable(false)
    let isLoading : Variable<Bool> = Variable(false)
    let errorMsg  : Variable<String> = Variable(String.Empty)
    
    init(homeService: BaseService) {
        service = homeService
        requestList()
    }
    
    func requestPagination() {
        if !isLoading.value {
            requestList()
        }
    }
    
    func setSelectedItem(by index: Int) {
        selectedCharacter = characterList[index]
        didSelectedRow.onNext(Void())
    }
    
    func requestList() {
        isLoading.value = true
        
        if let homeService = service as? HomeService {
            homeService.updateOffset(to: rows)
        }
        
        let _ : CharacterDataWrapper? = service.get(){
            responseSuccess , responseError in
            if let error = responseError {
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value = error.description()
            }
            if let marvelResponse =  responseSuccess,
                let marvelResponseData = marvelResponse.data,
                let characterResponseList = marvelResponseData.results {
                // persist info
                self.setCharacterList(with: characterResponseList)
                self.isSuccess.value = true
                self.isLoading.value = false
                
            }
            else {
                let parseError = CustomError(with: .parserError)
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value =  parseError.description()
            }
        }
        
    }
    
    func setCharacterList(with characterResponseList: [Character]) {
        self.characterList.append(contentsOf: characterResponseList)
    }
    
    func getCharacterBy(_ index: Int) -> Character? {
        if index > characterList.count-1 {
            return nil
        }
        else {
            return characterList[index]
        }
    }
    
}
