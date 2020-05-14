//
//  NavigationController.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }
}
