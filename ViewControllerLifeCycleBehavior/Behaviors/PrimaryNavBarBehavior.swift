//
//  PrimaryNavBarBehavior.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Behavior

protocol PrimaryNavBarBehavior: ViewControllerLifeCycleBehavior {
    var shouldChangeBarItemsColor: Bool { get set }
}

extension PrimaryNavBarBehavior {
    
    func beforeAppearing(_ viewController: UIViewController) {
        configureNavBarBackground(for: viewController)
    }

    func beforeLayingOutSubviews(_ viewController: UIViewController) {
        guard shouldChangeBarItemsColor else { return }
        let navigationController = viewController.navigationController
        let navigationItem = navigationController?.navigationBar.items?.last
        navigationController?.toolbarItems?.forEach { $0.tintColor = .white }
        navigationItem?.leftBarButtonItems?.forEach { $0.tintColor = .white }
        navigationItem?.leftBarButtonItem?.tintColor = .white
        navigationItem?.rightBarButtonItems?.forEach { $0.tintColor = .white }
        navigationItem?.rightBarButtonItem?.tintColor = .white
        shouldChangeBarItemsColor = false
    }

}

extension PrimaryNavBarBehavior {
    
    func configureNavBarBackground(for viewController: UIViewController) {
        let navigationController = viewController.navigationController
        let navigationBar = navigationController?.navigationBar
        navigationBar?.barTintColor = .primary
        navigationBar?.backgroundColor = .primary
        navigationBar?.titleTextAttributes = [.foregroundColor: UIColor.white]
        shouldChangeBarItemsColor = true
    }
    
}

// MARK: - Implementation

final class PrimaryNavBar: PrimaryNavBarBehavior {
    var shouldChangeBarItemsColor: Bool = true
}
