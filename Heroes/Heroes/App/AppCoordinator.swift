//
//  AppCoordinator.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {

    private var window = UIWindow(frame: UIScreen.main.bounds)


    override func start() {
        self.window.makeKeyAndVisible()
        self.showHome()
    }

    private func showHome() {
        self.removeChildCoordinators()

        let coordinator = AppDelegate.container.resolve(HomeCoordinator.self)!
        coordinator.navigationController = BaseNavigationController()
        self.start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(
            window: self.window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }


}
