//
//  BrowseChefCellDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseChefCellDataSource: NSObject {
    
    let chefs: [DivisionHeader:[Chef]]
    
    init(chefs: [DivisionHeader:[Chef]]) {
        self.chefs = chefs
        super.init()
    }
    
    func getChefsForCollectionViewTag(collectionViewTag: Int) -> [Chef] {
        let divisionHeader = DivisionHeader(rawValue: collectionViewTag)!
        return chefs[divisionHeader]!
    }
}

extension BrowseChefCellDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let chefs = getChefsForCollectionViewTag(collectionViewTag: collectionView.tag)
        return chefs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseChefCell.PropertyKeys.cellIdentifier, for: indexPath) as! BrowseChefCell
        
        let chefs = getChefsForCollectionViewTag(collectionViewTag: collectionView.tag)
        cell.configureCell(chef: chefs[indexPath.row])
        return cell
    }
}
