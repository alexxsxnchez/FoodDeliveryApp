//
//  ChefDetailViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-15.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ChefDetailViewController: UIViewController {
    
    var chef: Chef!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.title = chef.name
    }
    
}
