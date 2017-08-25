//
//  SeeAllCellDelegate.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-20.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class SeeAllCellDelegate: NSObject {
    
    let chefs: [Chef]
    let presentor: SeeAllPresentor
    
    init(chefs: [Chef], presentor: SeeAllPresentor) {
        self.chefs = chefs
        self.presentor = presentor
        super.init()
    }
}

extension SeeAllCellDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentor.ChefCellTapped(row: indexPath.row)
    }
}
