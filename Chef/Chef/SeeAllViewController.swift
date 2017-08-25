//
//  SeeAllViewController.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-16.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class SeeAllViewController: UIViewController {
    
    // MARK: - Properties
    var presentor: SeeAllPresentor!
    
    var tableViewDataSource: SeeAllCellDataSource! {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    
    var tableViewDelegate: SeeAllCellDelegate! {
        didSet {
            tableView.delegate = tableViewDelegate
        }
    }
    
    // MARK: - UI Elements
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SeeAllCell.self, forCellReuseIdentifier: SeeAllCell.PropertyKeys.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        automaticallyAdjustsScrollViewInsets = false
        setupTableView()
        presentor.viewLoaded()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        // constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
        ])
    }
    
    func setupDataSourceAndDelegate(chefs: [Chef]) {
        tableViewDataSource = SeeAllCellDataSource(chefs: chefs)
        tableViewDelegate = SeeAllCellDelegate(chefs: chefs, presentor: presentor)
    }
}
