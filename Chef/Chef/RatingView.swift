//
//  RatingView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-18.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class RatingView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alignment = .center
        self.axis = .horizontal
        self.distribution = .fill
        self.spacing = 4
        self.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            self.addArrangedSubview(emptyStarImageView)
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setRatingImageViews(rating: Double) {
        
        let emptyStars = arrangedSubviews
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
