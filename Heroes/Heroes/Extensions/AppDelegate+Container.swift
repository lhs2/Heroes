//
//  AppDelegate+Container.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension AppDelegate {
    internal func setupContainer() {
        setupServices()
        setupViewModels()
        setupCoordinators()
        
    }

    private func setupCoordinators(){
        AppDelegate.container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        AppDelegate.container.autoregister(HomeCoordinator.self, initializer:  HomeCoordinator.init)
        AppDelegate.container.autoregister(DetailCoordinator.self, initializer: DetailCoordinator.init)
        AppDelegate.container.autoregister(ComicDetailCoordinator.self, initializer: ComicDetailCoordinator.init)

    }

    private func setupServices(){
        AppDelegate.container.autoregister(HomeService.self, initializer: HomeService.init)
        AppDelegate.container.autoregister(ComicDetailService.self, initializer: ComicDetailService.init)
    }

    private func setupViewModels(){
        AppDelegate.container.register(HomeViewModel.self) {
            HomeViewModel(homeService: $0.resolve(HomeService.self)!)
        }
        AppDelegate.container.autoregister(DetailViewModel.self, initializer: DetailViewModel.init)
        AppDelegate.container.register(ComicDetailViewModel.self) {
            ComicDetailViewModel(comicDetailService: $0.resolve(ComicDetailService.self)!)
        }
    }

}
