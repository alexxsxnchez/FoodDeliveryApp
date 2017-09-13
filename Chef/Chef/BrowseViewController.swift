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
    
    fileprivate var divisionCollectionViewDataSource: BrowseDivisionCellDataSource! {
        didSet {
            collectionView.dataSource = divisionCollectionViewDataSource
        }
    }
    
    fileprivate var divisionCollectionViewDelegate: BrowseDivisionCellDelegate! {
        didSet {
            collectionView.delegate = divisionCollectionViewDelegate
        }
    }
    
    fileprivate var chefCollectionViewDataSource: BrowseChefCellDataSource!
    
    fileprivate var chefCollectionViewDelegate: BrowseChefCellDelegate!
    
    // MARK: - UI Elements
    fileprivate let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(BrowseDivisionCell.self, forCellWithReuseIdentifier: BrowseDivisionCell.PropertyKeys.cellIdentifier)
        
        return collectionView
    }()
    
    fileprivate var loadingView: LoadingView?
    fileprivate var emptyView: EmptyView?
    fileprivate var errorView: ErrorView?
    fileprivate var stateView: StateView?
    
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
        chefCollectionViewDelegate = BrowseChefCellDelegate(presentor: presentor)
        divisionCollectionViewDelegate = BrowseDivisionCellDelegate(chefCollectionViewDataSource: chefCollectionViewDataSource, chefCollectionViewDelegate: chefCollectionViewDelegate)
    }
    
}

// MARK: - StateViewController Extension
extension BrowseViewController: StateViewController {
    
    func showError(errorMessage: String) {
        stateView = ErrorView(errorMessage: errorMessage)
        view.addSubview(stateView!)
        constrainSubViewToBoundsOfSuper(subView: stateView!, superView: view)
        collectionView.isHidden = true
    }
    
    func showLoading() {
        stateView = LoadingView()
        view.addSubview(stateView!)
        constrainSubViewToBoundsOfSuper(subView: stateView!, superView: view)
        collectionView.isHidden = true
    }
    
    func showEmpty() {
        stateView = EmptyView()
        view.addSubview(stateView!)
        constrainSubViewToBoundsOfSuper(subView: stateView!, superView: view)
//        errorView?.isHidden = true
//        loadingView?.isHidden = true
//        emptyView?.isHidden = false
        collectionView.isHidden = true
    }
    
    func showActual() {
        view.addSubview(collectionView)
//        errorView?.isHidden = true
//        loadingView?.isHidden = true
//        emptyView?.isHidden = true
        stateView = nil
        collectionView.isHidden = false
        collectionView.alpha = 0.0
        // constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
        ])
        //constrainSubViewToBoundsOfSuper(subView: collectionView, superView: view)
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView.alpha = 1.0
        }
 
    }
}
