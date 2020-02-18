//
//  HomeView.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .home

    var viewModel : HomeViewModel?
    let disposeBag = DisposeBag()



}
