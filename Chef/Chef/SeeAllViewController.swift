//
//  SeeAllViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-16.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class SeeAllViewController: UIViewController {
    
    var divisionHeader: DivisionHeader!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.title = divisionHeader.asString()
    }
    
}
