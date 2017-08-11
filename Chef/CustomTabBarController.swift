//
//  CustomTabBarController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let browseViewController = BrowseViewController()
        let browseNavigationController = UINavigationController(rootViewController: browseViewController)
        browseNavigationController.title = "Browse"
        
        viewControllers = [browseNavigationController]
    }
}
