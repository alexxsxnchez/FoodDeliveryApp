//
//  ChefDetailViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-15.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ChefDetailViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate var menuDataSource: MenuDataSource!
    fileprivate var menuCollectionViewDelegate: MenuCollectionViewDelegate!
    
    // MARK: - UI Elements
    fileprivate let scrollView: ChefDetailScrollView = {
        let scrollView = ChefDetailScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = false
        return scrollView
    }()
    
    fileprivate let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    fileprivate let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.gray
        imageView.clipsToBounds = true
        imageView.image = nil
        return imageView
    }()
    
    fileprivate let headerView = ChefHeaderView()
    
    fileprivate let chefMenuReviewContainerView = ChefMenuReviewContainerView()
    
        
    fileprivate let upButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setTitle("⌃", for: .normal)
        button.setTitle("⇡", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.darkGray.withAlphaComponent(0.9)
        button.isUserInteractionEnabled = false
        button.alpha = 0.0
        return button
    }()
    
//    fileprivate var loadingView: LoadingView?
//    fileprivate var emptyView: EmptyView?
//    fileprivate var errorView: ErrorView?
    
    
    // MARK: - Init
    override func loadView() {
        super.loadView()
        //view.backgroundColor = .lightGray
        view.backgroundColor = UIColor(red: 205/255, green: 200/255, blue: 200/255, alpha: 1.0)
        upButton.addTarget(self, action: #selector(scrollUpToTopOfMenu(sender:)), for: .touchUpInside)
        scrollView.delegate = self
        chefMenuReviewContainerView.scrollViewPanGesture = scrollView.panGestureRecognizer
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(coverImageView)
        contentView.addSubview(headerView)
        contentView.addSubview(chefMenuReviewContainerView)
        view.addSubview(upButton)
        
        let coverImageHeightMultiplier: CGFloat = 0.3
        
        NSLayoutConstraint.activate([
            
            // Scroll View
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),

            // Cover Image
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: coverImageHeightMultiplier),
            
            // HeaderView
            headerView.topAnchor.constraint(equalTo: coverImageView.centerYAnchor, constant: view.frame.width * coverImageHeightMultiplier * 0.25),
            headerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            // ChefMenuReviewContainerView
            chefMenuReviewContainerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            chefMenuReviewContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            chefMenuReviewContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            chefMenuReviewContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // UpButton
            upButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -10),
            upButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
                        
            /*someView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            someView.heightAnchor.constraint(equalToConstant: 1000),
            someView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            someView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // MUST have some element constrained to the bottom anchor of content view
            someView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)*/
            
            // Next add another white background view that will surround the tabs and the collectionView/tableView
            
        ])
    }
    
    /*
     FOR NOW FORGET ABOUT PAN, ALSO CHANGE TAB ANIMATION TO USE TRANSFORM NOT CONSTRAINT ADJUSTMENT, THEN MAKE TAB CHANGE WITH SWIPE
    
     TEST LOADING VIEW WITH MENU
     
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //presentor.showLoaded()
        //showLoading()
        let foodItem = FoodItem(name: "Pasta")
        let menuSection = MenuSection(index: 0, title: "Entrees", foodItems: [foodItem])
        let menu = Menu(menuSections: [menuSection])
        configureMenuReviewContainerView(menu: menu)
        showActual()
    }
    
    func configureView(chef: Chef) {
        headerView.configureView(chef: chef, bioViewDelegate: self)
    }
    
    func configureMenuReviewContainerView(menu: Menu) {
        menuDataSource = MenuDataSource(menu: menu)
        menuCollectionViewDelegate = MenuCollectionViewDelegate()
        chefMenuReviewContainerView.setupDelegates(menuDataSource: menuDataSource, menuCollectionViewDelegate: menuCollectionViewDelegate)
    }
    
    func scrollUpToTopOfMenu(sender: UIButton) {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
}

// MARK: ScrollViewDelegate
extension ChefDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            if scrollView.contentOffset.y > 200 {
                self.upButton.isUserInteractionEnabled = true
                self.upButton.alpha = 1.0
            }
            else {
                self.upButton.isUserInteractionEnabled = false
                self.upButton.alpha = 0.0
            }
        }
    }
    
}

// MARK: - ChefBioViewDelegate
extension ChefDetailViewController : ChefBioViewDelegate {
    func buttonTapped() {
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}


// MARK: - StateViewController
extension ChefDetailViewController: StateViewController {
    
    
    func showError(errorMessage: String) {
        let stateView = ErrorView(errorMessage: errorMessage)
        chefMenuReviewContainerView.addStateViewToView(stateView: stateView)
    }

    func showLoading() {
        let stateView = LoadingView()
        chefMenuReviewContainerView.addStateViewToView(stateView: stateView)
    }

    func showEmpty() {
        let stateView = EmptyView()
        chefMenuReviewContainerView.addStateViewToView(stateView: stateView)
    }

    func showActual() {
        chefMenuReviewContainerView.addCollectionViewToView()
    }
}
