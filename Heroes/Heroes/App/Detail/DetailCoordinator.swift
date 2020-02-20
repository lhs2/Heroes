//
//  DetailCoordinator.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 19/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class DetailCoordinator: BaseCoordinator {
    
    private var viewModel: DetailViewModel
    private let disposebag = DisposeBag()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = DetailView.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.isNavigationBarHidden = false
        self.navigationController.present(viewController, animated: true, completion: nil)
    }
    
    func prepare(for viewModel: DetailViewModel) {
          self.viewModel = viewModel
    }
    
}
