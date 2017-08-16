//
//  DivisionHeader.swift
//  Chef
//
//  Created by Alex Sanchez on 2017-08-14.
//  Copyright © 2017 Alex Sanchez. All rights reserved.
//

enum DivisionHeader: Int {

    case New
    case Available
    case TopRated
    case Recent
    case Favourite

    func asString() -> String {
        switch self {
        case .New:
            return "New Chefs"
        case .Available:
            return "Available Chefs"
        case .TopRated:
            return "Top Rated Chefs"
        case .Recent:
            return "Your Recently Viewed"
        case .Favourite:
            return "Your Favorites"
        }
    }

    static let count: Int = {
        var count = 0
        while let _ = DivisionHeader(rawValue: count) {
            count += 1
        }
        return count
    }()
}
