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
    fileprivate var chefDivisionHeaderDictionary = [DivisionHeader:[Chef]]()
    
    init(networkController: NetworkController) {
        self.networkController = networkController
    }
    
    func getChefs(for divisionHeader: DivisionHeader) -> [Chef] {
        return chefDivisionHeaderDictionary[divisionHeader]!
    }
    
    func fetchChefs(completion: @escaping ([DivisionHeader:[Chef]]) -> Void) {
        
        /*fetchChefs(for: divisionHeader) { (chefs) in
            print("completion")
            self.chefDivisionHeaderDictionary[divisionHeader] = chefs
        }*/
        
        let when = DispatchTime.now() + .seconds(2) // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            let chefs = [
            Chef(name: "very very very extremely longgggggggg name", rating: 0),
            Chef(name: "very very long name", rating: 0.33),
            Chef(name: "name", rating: 0.75),
            Chef(name: "name", rating: 2.4),
            Chef(name: "name", rating: 3.4),
            Chef(name: "name", rating: 4.2),
            Chef(name: "name", rating: 4.5),
            Chef(name: "name", rating: 4.9),
            Chef(name: "name", rating: 5)
            ]
        
            for index in 0..<DivisionHeader.count {
                let divisionHeader = DivisionHeader(rawValue: index)!
                self.chefDivisionHeaderDictionary[divisionHeader] = chefs
            }
            
            completion(self.chefDivisionHeaderDictionary)

        }
        
        
                
        
    }
    
    /*func fetchChefs(for divisionHeader: DivisionHeader, completion: @escaping ([Chef]?) -> Void) {
        let chefs = networkController.fetchChefs(query: "")
        completion(chefs)
    }*/
}
