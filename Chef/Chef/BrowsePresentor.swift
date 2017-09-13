//
//  BrowsePresentor.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-24.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowsePresentor {
    
    weak var router: BrowseRouter!
    let viewController: BrowseViewController
    let stateController: StateController
    
    init(viewController: BrowseViewController, stateController: StateController, router: BrowseRouter) {
        self.router = router
        self.viewController = viewController
        self.stateController = stateController
    }
    
    func viewLoaded() {
        viewController.showLoading()
        // add result parameter and show view depending
        stateController.chefController.fetchChefs { (chefs) in
            self.viewController.setupDataSourcesAndDelegates(chefs: chefs)
            self.viewController.showActual()
            //self.viewController.showError(errorMessage: "ERROR")
            //self.viewController.showEmpty()
        }
        
    }
    
    func SeeAllButtonTapped(collectionViewTag: Int) {
        let divisionHeader = DivisionHeader(rawValue: collectionViewTag)!
        
        router.showSeeAll(divisionHeader: divisionHeader)
    }
    
    func ChefCellTapped(collectionViewTag: Int, row: Int) {
        let divisionHeader = DivisionHeader(rawValue: collectionViewTag)!
        let chefs = stateController.chefController.getChefs(for: divisionHeader)
        let chef = chefs[row]
        router.showChefDetails(chef: chef)
    }
    
}
