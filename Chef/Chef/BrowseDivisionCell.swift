//
//  BrowseDivisionCell.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseDivisionCell: UICollectionViewCell {
    
    // MARK: - Properties
    struct PropertyKeys {
        static let cellIdentifier = "browseDivisionCellId"
    }
    
    let dataSource = BrowseChefCellDataSource(chefs:
        [
            Chef(name: "very very very extremely long name"),//, image: nil, category: "category", price: 1.99),
            Chef(name: "very very long name"),// image: nil, category: "category", price: 3.99),
            Chef(name: "name"),// image: nil, category: "category", price: 0.99),
            Chef(name: "name"),// image: nil, category: "category", price: 1.99),
            Chef(name: "name"),// image: nil, category: "category", price: 3.99),
            Chef(name: "name"),// image: nil, category: "category", price: 0.99),
            Chef(name: "name"),// image: nil, category: "category", price: 1.99),
            Chef(name: "name"),// image: nil, category: "category", price: 3.99),
            Chef(name: "name")//, image: nil, category: "category", price: 0.99)
        ])
    
    var divisionHeader: String? {
        didSet {
            divisionHeaderLabel.text = divisionHeader
        }
    }
    
    // MARK: - UIElements
    fileprivate let divisionHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    fileprivate let seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "See All ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.darkGray])
        attributedText.append(NSMutableAttributedString(string: ">", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.lightGray]))
        button.setAttributedTitle(attributedText, for: .normal)
        
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.isEnabled = true
        return button
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BrowseChefCell.self, forCellWithReuseIdentifier: BrowseChefCell.PropertyKeys.cellIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    fileprivate let dividerLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray
        return line
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        
        addSubview(divisionHeaderLabel)
        addSubview(seeAllButton)
        addSubview(collectionView)
        addSubview(dividerLine)
        
        // divisionHeaderLabel
        divisionHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        divisionHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        // seeAllButton
        seeAllButton.firstBaselineAnchor.constraint(equalTo: divisionHeaderLabel.firstBaselineAnchor).isActive = true
        seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        // collectionView
        collectionView.topAnchor.constraint(equalTo: divisionHeaderLabel.bottomAnchor, constant: 4).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // dividerLine
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension BrowseDivisionCell: UICollectionViewDelegateFlowLayout {
 
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
     }
 }
