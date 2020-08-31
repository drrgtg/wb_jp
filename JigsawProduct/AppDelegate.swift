//
//  AppDelegate.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupDefaultData()
        setupRootVC()
        return true
    }
    func setupRootVC(){
        let wind = UIWindow(frame: UIScreen.main.bounds)
        window = wind
        wind.rootViewController = JPBasseNavigationController(rootViewController: JPMainViewController())
        wind.makeKeyAndVisible()
    }
    func setupDefaultData() {
        if UserDefaults.standard.string(forKey: kIAPDefaultGoldNumber) == nil {
            UserDefaults.standard.setValue("3000", forKey: kIAPDefaultGoldNumber)
        }
    }
}

