//
//  DetailView.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 19/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NVActivityIndicatorView

class DetailView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .detail
    
    var viewModel : DetailViewModel?
    let disposeBag = DisposeBag()

}
