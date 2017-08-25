//
//  BrowseViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    // MARK: - Properties
    
    var presentor: BrowsePresentor!
    
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
    
    // MARK: - UI Elements
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(BrowseDivisionCell.self, forCellWithReuseIdentifier: BrowseDivisionCell.PropertyKeys.cellIdentifier)
        
        return collectionView
    }()
    
    var loadingView: LoadingView?
    var emptyView: EmptyView?
    var errorView: ErrorView?
    
    // MARK: - Init
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        // fixes white space underneath navigation bar
        automaticallyAdjustsScrollViewInsets = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presentor.viewLoaded()
    }
    
    func setupDataSourcesAndDelegates(chefs: [DivisionHeader:[Chef]]) {
        
        // data sources
        chefCollectionViewDataSource = BrowseChefCellDataSource(chefs: chefs)
        divisionCollectionViewDataSource = BrowseDivisionCellDataSource(presentor: presentor)
        // delegates
        chefCollectionViewDelegate = BrowseChefCellDelegate(chefs: chefs, presentor: presentor)
        divisionCollectionViewDelegate = BrowseDivisionCellDelegate(chefCollectionViewDataSource: chefCollectionViewDataSource, chefCollectionViewDelegate: chefCollectionViewDelegate)
    }
    
}

// MARK: - StateViewController Extension
extension BrowseViewController: StateViewController {
    
    func showError(errorMessage: String) {
        errorView = ErrorView(frame: view.frame)
        errorView?.errorMessage = errorMessage
        view.addSubview(errorView!)
        errorView?.isHidden = false
        loadingView?.isHidden = false
        emptyView?.isHidden = true
        collectionView.isHidden = true
    }
    
    func showLoading() {
        loadingView = LoadingView(frame: view.frame)
        view.addSubview(loadingView!)
        errorView?.isHidden = true
        loadingView?.isHidden = false
        emptyView?.isHidden = true
        collectionView.isHidden = true
        
    }
    
    func showEmpty() {
        emptyView = EmptyView(frame: view.frame)
        view.addSubview(emptyView!)
        errorView?.isHidden = true
        loadingView?.isHidden = true
        emptyView?.isHidden = false
        collectionView.isHidden = true
    }
    
    func showActual() {
        view.addSubview(collectionView)
        errorView?.isHidden = true
        loadingView?.isHidden = true
        emptyView?.isHidden = true
        collectionView.alpha = 0.0
        collectionView.isHidden = false
        
        // constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
        ])
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView.alpha = 1.0
        }
 
    }
}
