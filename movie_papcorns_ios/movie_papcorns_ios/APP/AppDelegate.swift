//
//  AppDelegate.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setNavigationBar()
        
        /// 3rd part libraries
        FirebaseManager.start()
        
        startApp()
        
        return true
    }
    
    private func startApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabbarController()
        window?.makeKeyAndVisible()
    }
    
    private func setNavigationBar() {
        let largeTitleStyle: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        
        let titleStyle: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        
        let navAppearance = UINavigationBar.appearance()
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.black
        appearance.largeTitleTextAttributes = largeTitleStyle
        appearance.titleTextAttributes = titleStyle
        appearance.setBackIndicatorImage(I.iconBack, transitionMaskImage: I.iconBack)
        appearance.shadowColor = .clear
        
        navAppearance.scrollEdgeAppearance = appearance
        navAppearance.compactAppearance = appearance
        navAppearance.standardAppearance = appearance
        navAppearance.backItem?.title = ""
        navAppearance.isTranslucent = false
    }
}

