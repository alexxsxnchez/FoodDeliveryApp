//
//  CustomTabBarController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let stateController: StateController
    
    init(stateController: StateController) {
        
        self.stateController = stateController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error used required coder init")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let browseViewController = BrowseViewController()
        browseViewController.stateController = stateController
        
        let browseNavigationController = UINavigationController(rootViewController: browseViewController)
        browseNavigationController.title = "Browse"
        
        viewControllers = [browseNavigationController]
    }
}
