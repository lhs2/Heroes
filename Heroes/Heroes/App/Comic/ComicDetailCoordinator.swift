//
//  ComicDetailCoordinator.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class ComicDetailCoordinator: BaseCoordinator {
    
    private var viewModel: ComicDetailViewModel
    private let disposebag = DisposeBag()
    
    init(viewModel: ComicDetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = ComicDetailView.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.isNavigationBarHidden = false
        self.navigationController.present(viewController, animated: true, completion: nil)
    }
    
    func prepare(for character: Character) {
        self.viewModel.characterDetail = character
    }

}
