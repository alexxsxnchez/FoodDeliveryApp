//
//  BrowseChefCellDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseChefCellDataSource: NSObject {
    
    var chefs: [Chef]
    
    init(chefs: [Chef]) {
        self.chefs = chefs
    }
}

extension BrowseChefCellDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chefs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseChefCell.PropertyKeys.cellIdentifier, for: indexPath) as! BrowseChefCell
        cell.chef = chefs[indexPath.row]
        return cell
    }
}
