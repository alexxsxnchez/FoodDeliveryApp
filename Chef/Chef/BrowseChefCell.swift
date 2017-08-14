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
    
    fileprivate let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let starPointSize: CGFloat = 15
        for _ in 1...5 {
            let emptyStarImageView = UIImageView(image: #imageLiteral(resourceName: "empty_star"))
            emptyStarImageView.translatesAutoresizingMaskIntoConstraints = false
            emptyStarImageView.contentMode = .scaleAspectFit
            emptyStarImageView.heightAnchor.constraint(equalToConstant: starPointSize).isActive = true
            emptyStarImageView.widthAnchor.constraint(equalToConstant: starPointSize).isActive = true
            
            let filledStarImageView = UIImageView(image: #imageLiteral(resourceName: "filled_star"))
            emptyStarImageView.addSubview(filledStarImageView)

            filledStarImageView.translatesAutoresizingMaskIntoConstraints = false
            filledStarImageView.contentMode = .scaleAspectFit
            filledStarImageView.heightAnchor.constraint(equalToConstant: starPointSize).isActive = true
            filledStarImageView.widthAnchor.constraint(equalToConstant: starPointSize).isActive = true
            filledStarImageView.centerXAnchor.constraint(equalTo: filledStarImageView.superview!.centerXAnchor).isActive = true
            filledStarImageView.centerYAnchor.constraint(equalTo: filledStarImageView.superview!.centerYAnchor).isActive = true
            
            // set the filledStars initial height and width for masking purposes during initial load of cell
            filledStarImageView.frame.size.height = starPointSize
            filledStarImageView.frame.size.width = starPointSize
            
            stackView.addArrangedSubview(emptyStarImageView)
        }
        return stackView
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
            setRatingImageViews()
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(specialityLabel)
        addSubview(ratingStackView)
        
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
        
        // ratingStackView
        ratingStackView.topAnchor.constraint(equalTo: specialityLabel.bottomAnchor, constant: 0).isActive = true
        ratingStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setRatingImageViews() {
        
        let emptyStars = ratingStackView.arrangedSubviews
        let rating = chef.rating
        for (index, emptyStar) in emptyStars.enumerated() {
            let filledStar = emptyStar.subviews.first!
            if Double(index + 1) <= rating {
                filledStar.layer.mask = nil
                filledStar.isHidden = false
            } else if Double(index) < rating && rating < Double(index + 1) {
                let maskLayer = CALayer()
                let width = CGFloat(rating - Double(index)) * filledStar.frame.width
                maskLayer.frame = CGRect(x: 0, y: 0, width: width, height: filledStar.frame.height)
                maskLayer.backgroundColor = UIColor.black.cgColor
                filledStar.isHidden = false
                filledStar.layer.mask = maskLayer
                
            } else {
                filledStar.layer.mask = nil
                filledStar.isHidden = true
            }
        }
    }
}
