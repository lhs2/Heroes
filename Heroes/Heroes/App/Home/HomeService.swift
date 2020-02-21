//
//  HomeService.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
//import Alamofire

class HomeService: BaseService  {
    private var offset: Int = 0
    
    func updateOffset(to value: Int) {
        offset = value
    }
    
    override func get<CharacterDataWrapper>(
        completion: @escaping (CharacterDataWrapper?, CustomError?) -> Void) -> CharacterDataWrapper? where CharacterDataWrapper: Codable{
        let queryOffset = "\(offset)" as CVarArg
        let queryParameters = [queryOffset]
        Service.shared.request(.characterList,
                                 queryParameters,
                                 nil) { result in
                                    switch result {
                                    case .failure( let error):
                                        let customError = CustomError(error, type: .serviceError)
                                        
                                        completion(nil, customError)
                                    case .success(let data):
                                        do {
                                            let characterList = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
                                            completion(characterList, nil)
                                        } catch {
                                            completion(nil, CustomError(with:.parserError))
                                        }
                                        
                                    }
                                    
        }
        return nil
    }
    
    
}
