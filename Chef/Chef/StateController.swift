//
//  StateController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-14.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import Foundation

class StateController {
    
    let networkController: NetworkController = NetworkController()
    let chefController: ChefController
    let orderController: OrderController
    
    init() {
        self.chefController = ChefController(networkController: networkController)
        self.orderController = OrderController(networkController: networkController)
    }
}
