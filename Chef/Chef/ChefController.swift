//
//  ChefController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-14.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import Foundation

class ChefController {

    fileprivate let networkController: NetworkController
    fileprivate var chefDivisionHeaderDictionary = [DivisionHeader : [Chef]]()
    static var count = 0
    init(networkController: NetworkController) {
        self.networkController = networkController
    }
    
    func fetchChefs(for divisionHeader: DivisionHeader) -> [Chef] {
        
        if let chefs = chefDivisionHeaderDictionary[divisionHeader] {
            return chefs
        } else {
            
            let chefs = [
                Chef(name: "very very very extremely long name", rating: 0),//, image: nil, category: "category", price: 1.99),
                Chef(name: "very very long name", rating: 0.33),// image: nil, category: "category", price: 3.99),
                Chef(name: "name", rating: 0.75),// image: nil, category: "category", price: 0.99),
                Chef(name: "name", rating: 2.4),// image: nil, category: "category", price: 1.99),
                Chef(name: "name", rating: 3.4),// image: nil, category: "category", price: 3.99),
                Chef(name: "name", rating: 4.2),// image: nil, category: "category", price: 0.99),
                Chef(name: "name", rating: 4.5),// image: nil, category: "category", price: 1.99),
                Chef(name: "name", rating: 4.9),// image: nil, category: "category", price: 3.99),
                Chef(name: "name", rating: 5)//, image: nil, category: "category", price: 0.99)
            ]
            chefDivisionHeaderDictionary[divisionHeader] = chefs
            return chefs
        }
    }

}


