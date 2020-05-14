//
//  EdgesForExtendedLayoutBehavior.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

struct EdgesForExtendedLayoutBehavior: ViewControllerLifeCycleBehavior {

    func afterLoading(_ viewController: UIViewController) {
        guard #available(iOS 11.0, *) else {
            viewController.edgesForExtendedLayout = []
            return
        }
    }

}
