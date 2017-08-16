//
//  ViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

protocol DetailPresentor {
    func presentDetails(collectionViewTag: Int, indexPath: IndexPath)
    func presentSeeAll(collectionViewTag: Int)
}

class BrowseViewController: UIViewController {

    // MARK: - Properties
    var divisionCollectionViewDataSource: BrowseDivisionCellDataSource! {
        didSet {
            collectionView.dataSource = divisionCollectionViewDataSource
        }
    }
    
    var divisionCollectionViewDelegate: BrowseDivisionCellDelegate! {
        didSet {
            collectionView.delegate = divisionCollectionViewDelegate
        }
    }
    
    var chefCollectionViewDataSource: BrowseChefCellDataSource!
    
    var chefCollectionViewDelegate: BrowseChefCellDelegate!
    
    var stateController: StateController!
    
    // MARK: - UI Elements
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(BrowseDivisionCell.self, forCellWithReuseIdentifier: BrowseDivisionCell.PropertyKeys.cellIdentifier)
        
        return collectionView
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        navigationItem.title = "Browse"
        
        // fixes white space underneath navigation bar
        automaticallyAdjustsScrollViewInsets = false
        setupCollectionView()
    }
    
    func setupCollectionView() {
        chefCollectionViewDataSource = BrowseChefCellDataSource(stateController: stateController)
        chefCollectionViewDelegate = BrowseChefCellDelegate(presentor: self)
        
        divisionCollectionViewDataSource = BrowseDivisionCellDataSource(presentor: self)
        divisionCollectionViewDelegate = BrowseDivisionCellDelegate(chefCollectionViewDataSource: chefCollectionViewDataSource, chefCollectionViewDelegate: chefCollectionViewDelegate)
        
        view.addSubview(collectionView)
        
        // constraints
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }
}

extension BrowseViewController: DetailPresentor {
    
    func presentDetails(collectionViewTag: Int, indexPath: IndexPath) {
        let divisionHeader = DivisionHeader(rawValue: collectionViewTag)!
        let chef = stateController.chefController.fetchChefs(for: divisionHeader)[indexPath.row]
        let detailViewController = ChefDetailViewController()
        detailViewController.chef = chef
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func presentSeeAll(collectionViewTag: Int) {
        let divisionHeader = DivisionHeader(rawValue: collectionViewTag)!
        let seeAllViewController = SeeAllViewController()
        seeAllViewController.divisionHeader = divisionHeader
        navigationController?.pushViewController(seeAllViewController, animated: true)
    
    }
    
}

