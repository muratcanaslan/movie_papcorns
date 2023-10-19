//
//  TabBarItemType.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

protocol TabBarItem {

    var vc: UIViewController { get }

    var defaultImage: UIImage? { get }

    var selectedImage: UIImage? { get }
    
    var title: String? { get }
}

enum TabBarItemType: CaseIterable {
    
    case discover
    case favorties
}

extension TabBarItemType: TabBarItem {
    var vc: UIViewController {
        switch self {
        case .discover:
            let vc = DiscoverViewController()
            return vc
        case .favorties:
            let vc = FavoritesViewController()
            return vc
        }
    }
    
    var defaultImage: UIImage? {
        switch self {
        case .discover:
            return I.iconDiscoveryUnselected
        case .favorties:
            return I.iconFavoriteUnselected
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .discover:
            return I.iconDiscoverySelected
        case .favorties:
            return I.iconFavoriteSelected
        }
    }
    
    var title: String? {
        switch self {
        case .discover:
            return "Discover"
        case .favorties:
            return "Favorites"
        }
    }
    
}

