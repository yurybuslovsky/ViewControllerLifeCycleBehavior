//
//  BehaviorCombinations.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

final class PrimaryNavBar_EdgesForExtendedLayout:
    PrimaryNavBarBehavior,
    EdgesForExtendedLayoutBehavior
{
    
    var shouldChangeBarItemsColor: Bool = true
    
    func beforeAppearing(_ viewController: UIViewController) {
        configureNavBarBackground(for: viewController)
        configureEdges(for: viewController)
    }

}
