//
//  ComicDetailService.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

class ComicDetailService: BaseService  {
    private var characterID: Int = 0
    
    func updateID(to value: Int) {
        characterID = value
    }
    
    override func get<ComicDataWrapper>(
        completion: @escaping (ComicDataWrapper?, CustomError?) -> Void) -> ComicDataWrapper? where ComicDataWrapper: Codable{
        let queryID = "\(characterID)" as CVarArg
        let queryParameters = [queryID]
        Service.shared.request(.comicList,
                               queryParameters,
                               nil) { result in
                                switch result {
                                case .failure( let error):
                                    let customError = CustomError(error, type: .serviceError)
                                    completion(nil, customError)
                                case .success(let data):
                                    do {
                                        let comicList = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
                                        completion(comicList, nil)
                                    } catch {
                                        completion(nil, CustomError(with:.parserError))
                                    }
                                    
                                }
                                
        }
        return nil
    }
    
    
}
