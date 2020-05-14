//
//  BehaviorContainingVC.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

class BehaviorContainingVC<Behavior: ViewControllerLifeCycleBehavior>: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        Behavior() is PrimaryNavBarBehavior ? .lightContent : .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors([Behavior()])
    }
    
}
