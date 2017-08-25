//
//  BrowseRouter.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-20.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

final class BrowseRouter: NSObject, Router {
    
    let navigationController: UINavigationController
    let stateController: StateController
    weak var appRouter: AppRouter!
    var browseViewController: BrowseViewController!
    
    init(navigationController: UINavigationController, stateController: StateController, appRouter: AppRouter) {
        self.navigationController = navigationController
        self.stateController = stateController
        self.appRouter = appRouter
        super.init()
        setupInitViewController()
        
    }
    
    fileprivate func setupInitViewController() {
        browseViewController = BrowseViewController()
        browseViewController.navigationItem.title = "Browse"
        let presentor = BrowsePresentor(viewController: browseViewController, stateController: stateController, router: self)
        browseViewController.presentor = presentor
        navigationController.pushViewController(browseViewController, animated: false)
    }
    
    
    func showSeeAll(divisionHeader: DivisionHeader) {
        let seeAllViewController = SeeAllViewController()
        seeAllViewController.navigationItem.title = divisionHeader.asString()
        let presentor = SeeAllPresentor(viewController: seeAllViewController, stateController: stateController, router: self)
        seeAllViewController.presentor = presentor
        presentor.divisionHeader = divisionHeader
        navigationController.pushViewController(seeAllViewController, animated: true)
    }
    
    func showChefDetails(chef: Chef) {
        let chefDetailViewController = ChefDetailViewController()
        chefDetailViewController.chef = chef
        chefDetailViewController.navigationItem.title = chef.name
        navigationController.pushViewController(chefDetailViewController, animated: true)
    }
}
