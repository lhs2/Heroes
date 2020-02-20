//
//  DetailViewModel.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 19/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewModel {
    let didPressedButton = PublishSubject<Void>()
    var characterDetail: Character?
    
    var characterImagePath: String {
        guard let character = characterDetail else {
            return String.Empty
        }
        let imagePath = character.getThumbnailPath()
        return imagePath
    }
    
    var characterDescription: String {
        guard let character = characterDetail else {
            return String.Empty
        }
        let description = character.description ?? String.Empty
        return description
    }
    
    var characterName: String {
        guard let character = characterDetail else {
            return String.Empty
        }
        let name = character.name ?? String.Empty
        return name
    }
    
    
    func showExpensiveComic() {
        didPressedButton.onNext(Void())
    }

}
