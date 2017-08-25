//
//  AppRouter.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-20.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit


class AppRouter: NSObject {
    
    let tabBarController: UITabBarController
    let stateController = StateController()
    var childRouters = [Router]()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        super.init()
        
        let browseNavigationController = UINavigationController()
        browseNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let browseRouter = BrowseRouter(navigationController: browseNavigationController, stateController: stateController, appRouter: self)
        childRouters.append(browseRouter)
        
        let searchViewController = UIViewController()
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let viewControllers: [UIViewController] = [browseNavigationController, searchViewController]
        tabBarController.setViewControllers(viewControllers, animated: false)
    }
}
