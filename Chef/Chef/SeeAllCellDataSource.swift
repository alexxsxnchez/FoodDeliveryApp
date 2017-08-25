//
//  SeeAllCellDataSource.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-20.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class SeeAllCellDataSource: NSObject {
    
    let chefs: [Chef]
    
    init(chefs: [Chef]) {
        self.chefs = chefs
        super.init()
    }
    
}

extension SeeAllCellDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chefs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SeeAllCell.PropertyKeys.cellIdentifier, for: indexPath) as! SeeAllCell
        let chef = chefs[indexPath.row]
        cell.configureCell(chef: chef)
        return cell
        
    }
    
}
