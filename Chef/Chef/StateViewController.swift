//
//  StateViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-25.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import Foundation

protocol StateViewController: class {
    
    func showLoading()
    
    func showEmpty()
    
    func showError(errorMessage: String)
    
    func showActual()
}
