//
//  EdgesForExtendedLayoutBehavior.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Behavior

protocol EdgesForExtendedLayoutBehavior: ViewControllerLifeCycleBehavior {}

extension EdgesForExtendedLayoutBehavior {

    func beforeAppearing(_ viewController: UIViewController) {
        configureEdges(for: viewController)
    }

}

extension EdgesForExtendedLayoutBehavior {

    func configureEdges(for viewController: UIViewController) {
        guard #available(iOS 11.0, *) else {
            viewController.edgesForExtendedLayout = []
            return
        }
    }
    
}

// MARK: Implementation

final class EdgesForExtendedLayout: EdgesForExtendedLayoutBehavior {}
