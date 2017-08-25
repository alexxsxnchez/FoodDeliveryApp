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
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }
        
        set {
            collectionView.contentOffset.x = newValue
        }
    }
    
    var presentor: BrowsePresentor!
    
    // MARK: - UIElements
    fileprivate let divisionHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "See All ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.darkGray])
        attributedText.append(NSMutableAttributedString(string: ">", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.lightGray]))
        button.setAttributedTitle(attributedText, for: .normal)
        button.isUserInteractionEnabled = true
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.isEnabled = true
        button.sizeToFit()
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
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
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
        
        addSubview(divisionHeaderLabel)
        addSubview(seeAllButton)
        addSubview(collectionView)
        addSubview(dividerLine)
        
        seeAllButton.addTarget(self, action: #selector(SeeAllButtonTapped(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            // divisionHeaderLabel constraint
            divisionHeaderLabel.topAnchor.constraint(equalTo: topAnchor),
            divisionHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            // seeAllButton constraints
            seeAllButton.firstBaselineAnchor.constraint(equalTo: divisionHeaderLabel.firstBaselineAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // collectionView constraints
            collectionView.topAnchor.constraint(equalTo: divisionHeaderLabel.bottomAnchor, constant: 4),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // dividerLine constraints
            dividerLine.heightAnchor.constraint(equalToConstant: 0.5),
            dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Functions
    func configureCell(divisionHeader: DivisionHeader, presentor: BrowsePresentor) {
        divisionHeaderLabel.text = divisionHeader.asString()
        self.presentor = presentor
    }
    
    func setCollectionViewDataSourceDelegate(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, for row: Int) {
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.tag = row
    }
    
    func SeeAllButtonTapped(sender: UIButton!) {
        presentor.SeeAllButtonTapped(collectionViewTag: collectionView.tag)
    }
    
}
