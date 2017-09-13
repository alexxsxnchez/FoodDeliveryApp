//
//  ChefHeaderView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-09-01.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ChefHeaderView: UIView {
    
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
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        //label.font = UIFont.boldSystemFont(ofSize: 22)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        
        return label
    }()
    
    fileprivate let specialityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont.systemFont(ofSize: 13)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        //label.textColor = .darkGray
        return label
    }()
    
    fileprivate let ratingStackView = RatingView()
    
    fileprivate let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 4 // make spacing dynamic based off length of name label
        return stackView
    }()
    
    fileprivate let bioView = ChefBioView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        applyShadow()
        
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(specialityLabel)
        labelStackView.addArrangedSubview(ratingStackView)
        
        addSubview(profileImageView)
        addSubview(labelStackView)
        addSubview(bioView)
        
        NSLayoutConstraint.activate([
            
            // image view
            profileImageView.centerYAnchor.constraint(equalTo: topAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),

            // label stack view
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            labelStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
            labelStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // bio view
            bioView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 4),
            bioView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bioView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            bioView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyShadow() {
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.black.cgColor
    }
    
    func configureView(chef: Chef, bioViewDelegate: ChefBioViewDelegate) {
        profileImageView.image = nil
        nameLabel.text = chef.name
        specialityLabel.text = "Food Speciality | Location"
        ratingStackView.setRatingImageViews(rating: chef.rating)
        bioView.delegate = bioViewDelegate
        bioView.setText(to: "Miusov, as a man man of breeding and deilcacy, could not but feel some inwrd qualms, when he reached the Father Superiors with Ivan: he felt ashamed of havin lost his temper. He felt that he ought to have disdaimed that despicable wretch, Fyodor Pavlovitch, too much to have been upset by him in Father Zossimas cell, and so to have forgotten himself. Teh monks were not to blame, in any case, he reflceted, on the steps. And if they're decent people here (and the Father Superior, I understand, is a nobleman) why not be friendly and courteous withthem? I won't argue, Ill fall in with everything, Ill win them by politness, and show them that I've nothing to do with that Aesop, thta buffoon, that Pierrot, and have merely been takken in over this affair, just as they have. He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were.")
        //bioView.setText(to: "Hello world")
    }
}
