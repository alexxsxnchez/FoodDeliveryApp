//
//  ChefDetailScrollView.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-09-11.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

import UIKit

class ChefDetailScrollView: UIScrollView, UIGestureRecognizerDelegate {

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == panGestureRecognizer {
            print("b")
            let b = abs(panGestureRecognizer.velocity(in: gestureRecognizer.view!).x) < abs(panGestureRecognizer.velocity(in: gestureRecognizer.view!).y) + 3
            print(b)
            return b
        }
        return true
    }
    
    


}
