//
//  NetworkController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-14.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import Foundation

class NetworkController {
    

    func fetchChefs(query: String) -> [Chef] {
        print("fetch chefs in network controller called")
        
            let chefs = [
            Chef(name: "very very very extremely long name", rating: 0),
            Chef(name: "very very long name", rating: 0.33),
            Chef(name: "name", rating: 0.75),
            Chef(name: "name", rating: 2.4),
            Chef(name: "name", rating: 3.4),
            Chef(name: "name", rating: 4.2),
            Chef(name: "name", rating: 4.5),
            Chef(name: "name", rating: 4.9),
            Chef(name: "name", rating: 5)
            ]
            
        return chefs
        
    }
}
