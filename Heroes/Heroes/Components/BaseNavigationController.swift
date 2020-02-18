//
//  BaseNavigationController.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false

        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = UIColor(displayP3Red: 222/255.0, green: 71/255.0, blue: 114/255.0, alpha: 1)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]


    }
    func addNavBarTitle() {
        navigationItem.title = "Home"

    }

}
