//
//  BrowseDivisionCellDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseDivisionCellDataSource: NSObject {
    
    var divisionHeaders: [String]
    
    init(divisionHeaders: [String]) {
        self.divisionHeaders = divisionHeaders
    }
    
}

extension BrowseDivisionCellDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return divisionHeaders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseDivisionCell.PropertyKeys.cellIdentifier, for: indexPath) as! BrowseDivisionCell
        cell.divisionHeader = divisionHeaders[indexPath.row]
        return cell
    }

}
