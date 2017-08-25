//
//  ErrorView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-25.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ErrorView: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
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
