//
//  BrowseDivisionCellDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseDivisionCellDataSource: NSObject {
    
    let presentor: DetailPresentor
    
    init(presentor: DetailPresentor) {
        self.presentor = presentor
        super.init()
    }
}

extension BrowseDivisionCellDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DivisionHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseDivisionCell.PropertyKeys.cellIdentifier, for: indexPath) as! BrowseDivisionCell
        
        let divisionHeader = DivisionHeader(rawValue: indexPath.row)!
        cell.configureCell(divisionHeader: divisionHeader, presentor: presentor)
        return cell
    }

}
