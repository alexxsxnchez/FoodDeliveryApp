//
//  ChefMenuDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-09-05.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class MenuDataSource: NSObject {
    
    let menu: Menu
    
    init(menu: Menu) {
        print("source created")
        self.menu = menu
        super.init()
    }
    
}

extension MenuDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return menu.menuSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let menuSection = menu.menuSections[section]
        return menuSection.foodItems.count + 50
    }
    
    /*func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MenuHeader.PropertyKeys.headerIdentifier, for: indexPath) as! MenuHeader
        let headerName = menu.menuSections[indexPath.section].title
        header.configureHeader(headerName: headerName)
        print("headerName: \(headerName)")
        return header
    }*/
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.PropertyKeys.cellIdentifier, for: indexPath) as! MenuCell
        //let foodItem = menu.menuSections[indexPath.section].foodItems[indexPath.row]
        let foodItem = menu.menuSections[indexPath.section].foodItems[0]
        cell.configureView(foodItem: foodItem)
        return cell
    }
}
