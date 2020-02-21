//
//  Storyboard+Instance.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
     static var storyboard: StoryboardType { get }
     static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as! Self

        return viewController
    }
}

enum StoryboardType: String {
    case home = "Home"
    case detail = "Detail"
    case comicDetail = "ComicDetail"
}
