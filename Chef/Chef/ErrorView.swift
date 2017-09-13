//
//  ErrorView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-25.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ErrorView: StateView {

    var errorMessage: String! {
        didSet {
            label.text = errorMessage
        }
    }
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
