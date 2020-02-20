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
        setupCoordinators()
        setupServices()
        setupViewModels()
        Container.loggingFunction = nil
    }

    private func setupCoordinators(){
        AppDelegate.container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        AppDelegate.container.autoregister(HomeCoordinator.self, initializer:  HomeCoordinator.init)

    }

    private func setupServices(){
        AppDelegate.container.autoregister(HomeService.self, initializer: HomeService.init)
    }

    private func setupViewModels(){
        AppDelegate.container.register(HomeViewModel.self) {
            HomeViewModel(homeService: $0.resolve(HomeService.self)!)
        }
    }

}
