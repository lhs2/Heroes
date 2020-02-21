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
        navigationBar.isTranslucent = false
        
        navigationBar.tintColor = .white
        navigationBar.barTintColor = UIColor(displayP3Red: 5/255.0, green: 60/255.0, blue: 94/255.0, alpha: 1)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        addNavBarImage()
    }
    
    
    func addNavBarImage() {

        let logo = UIImage(named: "ironMan.png")

        let imageView = UIImageView(image:logo)
        imageView.contentMode = .top
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.addSubview(imageView)

        navigationBar.addConstraint (navigationBar.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 0))
        navigationBar.addConstraint (navigationBar.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: 0))
        navigationBar.addConstraint (navigationBar.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0))
        navigationBar.addConstraint (navigationBar.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0))
    }

}

