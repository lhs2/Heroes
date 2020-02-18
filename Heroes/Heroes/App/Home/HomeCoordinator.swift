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
    private let disposebag = DisposeBag()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    override func start() {
        let viewController = HomeView.instantiate()
        viewController.viewModel = viewModel

        self.navigationController.isNavigationBarHidden = false
        self.navigationController.viewControllers = [viewController]
    }

}
