//
//  SeeAllPresentor.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-25.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class SeeAllPresentor {
    
    weak var router: BrowseRouter!
    let viewController: SeeAllViewController
    let stateController: StateController
    var divisionHeader: DivisionHeader!
    
    init(viewController: SeeAllViewController, stateController: StateController, router: BrowseRouter) {
        self.router = router
        self.viewController = viewController
        self.stateController = stateController
    }
    
    func viewLoaded() {
        let chefs = stateController.chefController.getChefs(for: divisionHeader)
        viewController.setupDataSourceAndDelegate(chefs: chefs)
    }
    
    func ChefCellTapped(row: Int) {
        let chefs = stateController.chefController.getChefs(for: divisionHeader)
        let chef = chefs[row]
        router.showChefDetails(chef: chef)
    }

}
