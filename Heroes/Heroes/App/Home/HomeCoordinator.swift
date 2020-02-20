//
//  HomeCoordinator.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class HomeCoordinator: BaseCoordinator {
    
    private let viewModel: HomeViewModel
    private var detailViewModel: DetailViewModel
    private let disposebag = DisposeBag()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.detailViewModel = DetailViewModel()
    }
    
    override func start() {
        self.setUpBindings()
        
        let viewController = HomeView.instantiate()
        viewController.viewModel = viewModel
        
        self.navigationController.isNavigationBarHidden = false
        self.navigationController.viewControllers = [viewController]
    }
    
    
    private func didSelectCharacter() {
        let coordinator: DetailCoordinator = AppDelegate.container.resolve(DetailCoordinator.self)!
        coordinator.navigationController = self.navigationController
        
        detailViewModel.characterDetail = viewModel.selectedCharacter
        coordinator.prepare(for: detailViewModel)
        
        start(coordinator: coordinator)
        

    }
    
    private func setUpBindings() {
        self.viewModel.didSelectedRow
            .subscribe(onNext: { [weak self] in self?.didSelectCharacter() })
            .disposed(by: self.disposebag)
        
    }
    
}
