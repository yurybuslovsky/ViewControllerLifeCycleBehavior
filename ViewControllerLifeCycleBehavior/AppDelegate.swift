//
//  AppDelegate.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        return true
    }

}

