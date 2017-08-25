//
//  BrowseChefCellDelegate.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-15.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class BrowseChefCellDelegate : NSObject {
    
    let presentor: BrowsePresentor
    let chefs: [DivisionHeader:[Chef]]
    
    init(chefs: [DivisionHeader:[Chef]], presentor: BrowsePresentor) {
        self.chefs = chefs
        self.presentor = presentor
        super.init()
    }
    
}

extension BrowseChefCellDelegate : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presentor.ChefCellTapped(collectionViewTag: collectionView.tag, row: indexPath.row)
        
    }
    
}
