//
//  StateViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-25.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

protocol StateViewController: class {
    
    //var stateView: StateView { get set }
    
    func showLoading()
    
    func showEmpty()
    
    func showError(errorMessage: String)
    
    func showActual()
}

extension StateViewController {
    func constrainSubViewToBoundsOfSuper(subView: UIView, superView: UIView) {
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: superView.topAnchor),
            subView.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
