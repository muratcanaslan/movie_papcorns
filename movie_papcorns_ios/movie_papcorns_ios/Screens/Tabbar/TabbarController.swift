//
//  TabbarController.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

final class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
        setViewControllers()
    }
    
    func setupTabbar() {
        let appeareance = UITabBarAppearance()
        appeareance.configureWithOpaqueBackground()
        appeareance.configureWithTransparentBackground()
        appeareance.backgroundColor = .black
        self.tabBarController?.tabBar.standardAppearance = appeareance

        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .labelColor2()
        
        let itemAppearence = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11, weight: .semibold)]
        itemAppearence.setTitleTextAttributes(attributes, for: .normal)
        
        tabBar.isTranslucent = true
    }

    func setViewControllers() {
        var vcs = [UIViewController]()
        
        TabBarItemType.allCases.forEach { type in
            let item = UITabBarItem(title: type.title, image: type.defaultImage, selectedImage: type.selectedImage)
            let vc = UINavigationController(rootViewController: type.vc)
            vc.navigationItem.largeTitleDisplayMode = .always
            vc.navigationBar.prefersLargeTitles = true
            vc.tabBarItem = item
            vcs.append(vc)
        }
        
        setViewControllers(vcs, animated: true)
    }
}
