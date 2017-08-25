//
//  SeeAllCell.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-18.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class SeeAllCell: UITableViewCell {
    
    // MARK: - Properties
    struct PropertyKeys {
        static let cellIdentifier = "seeAllCellId"
    }
    
    // MARK: - UI Elements
    fileprivate let profileImageView: UIImageView = {
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
    
    fileprivate let ratingStackView = RatingView()
    
    fileprivate let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 8 // make spacing dynamic based off length of name label
        return stackView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        addSubview(profileImageView)
        addSubview(labelStackView)
        
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(specialityLabel)
        labelStackView.addArrangedSubview(ratingStackView)

        NSLayoutConstraint.activate([
            // imageView constraints
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            // labelStackView constraints
            labelStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            labelStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Functions
    
    func configureCell(chef: Chef) {
        profileImageView.image = nil
        nameLabel.text = chef.name
        specialityLabel.text = "Food Speciality"
        ratingStackView.setRatingImageViews(rating: chef.rating)
    }

}
