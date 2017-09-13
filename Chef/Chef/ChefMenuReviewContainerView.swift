//
//  ChefMenuReviewContainerView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-09-03.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

protocol ChefMenuReviewContainerViewDelegate {
    func tabSelected(isMenuTab: Bool)
}

class ChefMenuReviewContainerView: UIView {

    // MARK: - Properties
    fileprivate var isMenuSelected = true
    
    // MARK: - UI Elements
    var scrollViewPanGesture: UIPanGestureRecognizer!
    
    fileprivate let tabView = ChefTabView()
    
    fileprivate let menuReviewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let menuCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.PropertyKeys.cellIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        //collectionView.register(MenuHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MenuHeader.PropertyKeys.headerIdentifier)
        
        return collectionView
    }()
    
    fileprivate var stateView: StateView?
    
    fileprivate let panGesture = UIPanGestureRecognizer()
    
    fileprivate let leftSwipeGesture: UISwipeGestureRecognizer = {
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.direction = .left
        return swipeGesture
    }()
    
    fileprivate let rightSwipeGesture: UISwipeGestureRecognizer = {
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.direction = .right
        return swipeGesture
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tabView)
        tabView.delegate = self
        panGesture.delegate = self
        addSubview(menuReviewView)
        //addGestureRecognizer(leftSwipeGesture)
        //addGestureRecognizer(rightSwipeGesture)
        addGestureRecognizer(panGesture)
        //leftSwipeGesture.addTarget(self, action: #selector(menuReviewSwipeGestureOccurred(_:)))
        //rightSwipeGesture.addTarget(self, action: #selector(menuReviewSwipeGestureOccurred(_:)))
        panGesture.addTarget(self, action: #selector(menuReviewPanOccurred(_:)))
        
        // Constraints
        NSLayoutConstraint.activate([
            
            // TabView
            tabView.topAnchor.constraint(equalTo: topAnchor),
            tabView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tabView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // MenuReviewView
            menuReviewView.topAnchor.constraint(equalTo: tabView.bottomAnchor, constant: 8),
            menuReviewView.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuReviewView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            menuReviewView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupDelegates(menuDataSource: MenuDataSource, menuCollectionViewDelegate: MenuCollectionViewDelegate) {
        
        //delegate = menuReviewContainerViewDelegate
        //tabView.delegate = tabViewDelegate
        menuCollectionView.dataSource = menuDataSource
        menuCollectionView.delegate = menuCollectionViewDelegate
        
    }
    
    func addStateViewToView(stateView: StateView) {
        self.stateView = stateView
        menuReviewView.addSubview(stateView)
        constrainViewToMenuReviewView(view: stateView)
        stateView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        menuCollectionView.isHidden = true
    }
    
    func addCollectionViewToView() {
        self.stateView = nil
        menuReviewView.addSubview(menuCollectionView)
        constrainViewToMenuReviewView(view: menuCollectionView)
        menuCollectionView.isHidden = false
        let height = CGFloat(((menuCollectionView.dataSource as! MenuDataSource).menu.menuSections[0].foodItems.count + 25) * (50 + 2))
        menuCollectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        menuCollectionView.alpha = 0.0
        UIView.animate(withDuration: 0.3) {
            self.menuCollectionView.alpha = 1.0
        }

    }
    
    fileprivate func constrainViewToMenuReviewView(view: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: menuReviewView.topAnchor),
            view.leadingAnchor.constraint(equalTo: menuReviewView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: menuReviewView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: menuReviewView.bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    
    func menuReviewPanOccurred(_ gesture: UIPanGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            let translation = gesture.translation(in: self)
            if isMenuSelected {
                menuReviewView.transform = CGAffineTransform(translationX: translation.x, y: 0)
            } else {
                menuReviewView.transform = CGAffineTransform(translationX: translation.x - frame.width, y: 0)
            }
            
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.25) {
                
                if self.isMenuSelected {
                    if self.menuReviewView.transform.tx < -(self.frame.width / 2) || gesture.velocity(in: self).x < -50 {
                        self.menuReviewView.transform = CGAffineTransform(translationX: -(self.frame.width), y: 0)
                        self.isMenuSelected = !self.isMenuSelected
                        
                    } else {
                        self.menuReviewView.transform = CGAffineTransform.identity
                    }
                } else {
                    if self.menuReviewView.transform.tx + self.frame.width > (self.frame.width / 2) ||  gesture.velocity(in: self).x > 50 {
                        self.menuReviewView.transform = CGAffineTransform.identity
                        self.isMenuSelected = !self.isMenuSelected
                    } else {
                        self.menuReviewView.transform = CGAffineTransform(translationX: -(self.frame.width), y: 0)
                    }
                }
            }
        }
    }
 
    
    
    func menuReviewSwipeGestureOccurred(_ gesture: UISwipeGestureRecognizer) {
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.25) {
                if gesture.direction == .left {
                    
                    self.menuReviewView.transform = CGAffineTransform(translationX: -(self.frame.width), y: 0)
                    self.isMenuSelected = false
                    self.tabView.animateTabSelection(isMenuTabSelected: false)
                } else if gesture.direction == .right {
                    self.menuReviewView.transform = CGAffineTransform.identity
                    self.isMenuSelected = true
                    self.tabView.animateTabSelection(isMenuTabSelected: true)
                }
            }
        }
    }
    
}

// MARK: - ChefTabViewDelegate
extension ChefMenuReviewContainerView : ChefTabViewDelegate {
    func tabButtonTapped(menuTabSelected: Bool) {
        // show either menu or reviews
        isMenuSelected = menuTabSelected
        
        // animate with button tap, BUT with swipe animation, just move the menu according to user touch on screen
        UIView.animate(withDuration: 0.25) {
            if menuTabSelected {
                self.menuReviewView.transform = CGAffineTransform.identity
            }
            else {
                print(self.frame.width)
                self.menuReviewView.transform = CGAffineTransform(translationX: -(self.frame.width), y: 0)
            }
        }
    }
}

extension ChefMenuReviewContainerView : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        super.gestureRecognizerShouldBegin(gestureRecognizer)
        if gestureRecognizer == panGesture {
            print("a")
            let a = abs(panGesture.velocity(in: self).y) < abs(panGesture.velocity(in: self).x) + 3
            print(a)
            return a
        }
        return true
    }
    /*func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == panGesture && otherGestureRecognizer == scrollViewPanGesture {
            return true
        }
        
        if gestureRecognizer == leftSwipeGesture || gestureRecognizer == rightSwipeGesture {
            return true
        }
        return false
    }
    
    gest*/
}

