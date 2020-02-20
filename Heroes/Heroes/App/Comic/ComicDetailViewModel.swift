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
    let didPressedButton = PublishSubject<Void>()
    let service: BaseService
    var characterDetail: Character?
    
    init(homeService: BaseService) {
        service = homeService
    }
}
