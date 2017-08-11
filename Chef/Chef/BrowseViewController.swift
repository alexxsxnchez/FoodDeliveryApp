//
//  ViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    // MARK: - Properties
    let dataSource = BrowseDivisionCellDataSource(divisionHeaders: ["New Chefs", "Available Chefs", "Top Rated Chefs", "Your Recently Viewed", "Your Favorites"])
    
    // MARK: - UI Elements
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(BrowseDivisionCell.self, forCellWithReuseIdentifier: BrowseDivisionCell.PropertyKeys.cellIdentifier)
        
        return collectionView
    }()
    
    // MARK: - Functions
    override func viewDidLoad() {
        navigationItem.title = "Browse"
        
        // fixes white space underneath navigation bar
        automaticallyAdjustsScrollViewInsets = false
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.reloadData()
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }
}

extension BrowseViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
    }

}

