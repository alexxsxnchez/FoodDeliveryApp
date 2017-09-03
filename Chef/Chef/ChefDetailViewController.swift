//
//  ChefDetailViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-15.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ChefDetailViewController: UIViewController {
    
    // MARK: - UI Elements
    fileprivate let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
        imageView.backgroundColor = UIColor.yellow
        imageView.clipsToBounds = true
        imageView.image = nil
        return imageView
    }()
    
    fileprivate let headerView = ChefHeaderView()
    
    fileprivate let someView = UIView()
    
    fileprivate let tabView = ChefTabView()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .lightGray
        tabView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(coverImageView)
        contentView.addSubview(headerView)
        contentView.addSubview(tabView)
        //contentView.addSubview(someView)
        someView.backgroundColor = .blue
        someView.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            // TabView
            tabView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            tabView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tabView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tabView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            /*someView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            someView.heightAnchor.constraint(equalToConstant: 1000),
            someView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            someView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // MUST have some element constrained to the bottom anchor of content view
            someView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)*/
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureView(chef: Chef) {
        headerView.configureView(chef: chef, bioViewDelegate: self)
    }
    
}

extension ChefDetailViewController : ChefBioViewDelegate {
    func buttonTapped() {
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ChefDetailViewController : ChefTabViewDelegate {
    func tabButtonTapped(menuTabSelected: Bool) {
        // show either menu or reviews
    }
}


