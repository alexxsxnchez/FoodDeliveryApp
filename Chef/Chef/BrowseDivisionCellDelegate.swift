//
//  BrowseDivisionCellDelegate.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-15.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseDivisionCellDelegate: NSObject {
    
    let chefCollectionViewDataSource: BrowseChefCellDataSource
    let chefCollectionViewDelegate: BrowseChefCellDelegate
    var storedOffsets = [Int: CGFloat]()
    
    init(chefCollectionViewDataSource: BrowseChefCellDataSource, chefCollectionViewDelegate: BrowseChefCellDelegate) {
        self.chefCollectionViewDataSource = chefCollectionViewDataSource
        self.chefCollectionViewDelegate = chefCollectionViewDelegate
        super.init()
    }
    
}

extension BrowseDivisionCellDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let browseDivisionCell = cell as! BrowseDivisionCell
        browseDivisionCell.setCollectionViewDataSourceDelegate(dataSource: chefCollectionViewDataSource, delegate: chefCollectionViewDelegate, for: indexPath.row)
        browseDivisionCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let browseDivisionCell = cell as! BrowseDivisionCell
        storedOffsets[indexPath.row] = browseDivisionCell.collectionViewOffset
    }
}
