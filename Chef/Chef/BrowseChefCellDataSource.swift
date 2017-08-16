//
//  BrowseChefCellDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseChefCellDataSource: NSObject {
    
    let stateController: StateController
    
    init(stateController: StateController) {
        self.stateController = stateController
        super.init()
    }
}

extension BrowseChefCellDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let divisionHeader = DivisionHeader(rawValue: collectionView.tag)!
        let chefs = stateController.chefController.fetchChefs(for: divisionHeader)
        return chefs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseChefCell.PropertyKeys.cellIdentifier, for: indexPath) as! BrowseChefCell
        
        let divisionHeader = DivisionHeader(rawValue: collectionView.tag)!
        let chefs = stateController.chefController.fetchChefs(for: divisionHeader)
        cell.configureCell(chef: chefs[indexPath.row])
        return cell
    }
}
