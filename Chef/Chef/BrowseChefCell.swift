//
//  BrowseChefCell.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseChefCell: UICollectionViewCell {
    
    // MARK: - Properties
    struct PropertyKeys {
        static let cellIdentifier = "browseChefCellId"
    }
    
    // MARK: - UI Elements
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    fileprivate let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate let specialityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    fileprivate let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    var chef: Chef! {
        didSet {
            imageView.image = nil
            nameLabel.text = chef.name
            specialityLabel.text = "Food Speciality"
            ratingLabel.text = "Rating Stars"
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(specialityLabel)
        addSubview(ratingLabel)
        
        // imageView
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        // nameLabel
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        // specialityLabel
        specialityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        specialityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        
        // ratingLabel
        ratingLabel.topAnchor.constraint(equalTo: specialityLabel.bottomAnchor, constant: 0).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
