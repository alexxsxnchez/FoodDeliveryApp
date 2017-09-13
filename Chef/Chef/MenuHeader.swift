//
//  CollectionReusableView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-09-05.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class MenuHeader: UICollectionReusableView {
    
    // MARK: - Properties
    struct PropertyKeys {
        static let headerIdentifier = "MenuHeaderIdentifier"
    }
    
    // MARK: - UI Elements
    fileprivate let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureHeader(headerName: String) {
        nameLabel.text = headerName
        print(headerName)
    }
}
