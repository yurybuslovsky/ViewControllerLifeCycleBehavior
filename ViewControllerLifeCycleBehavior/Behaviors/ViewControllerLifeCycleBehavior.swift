//
//  ViewControllerLifeCycleBehavior.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

protocol ViewControllerLifeCycleBehavior: class {
    init()
    func afterLoading(_ viewController: UIViewController)
    func beforeAppearing(_ viewController: UIViewController)
    func afterAppearing(_ viewController: UIViewController)
    func beforeDisappearing(_ viewController: UIViewController)
    func afterDisappearing(_ viewController: UIViewController)
    func beforeLayingOutSubviews(_ viewController: UIViewController)
    func afterLayingOutSubviews(_ viewController: UIViewController)
}

// MARK: - Default implementation

extension ViewControllerLifeCycleBehavior {
    func afterLoading(_ viewController: UIViewController) {}
    func beforeAppearing(_ viewController: UIViewController) {}
    func afterAppearing(_ viewController: UIViewController) {}
    func beforeDisappearing(_ viewController: UIViewController) {}
    func afterDisappearing(_ viewController: UIViewController) {}
    func beforeLayingOutSubviews(_ viewController: UIViewController) {}
    func afterLayingOutSubviews(_ viewController: UIViewController) {}
}

// MARK: - UIViewController + Lifecycle Behavior

extension UIViewController {
        
    private final class LifeCycleBehaviorViewController: UIViewController {
        
        private let behaviors: [ViewControllerLifeCycleBehavior]
        
        init(behaviors: [ViewControllerLifeCycleBehavior]) {
            self.behaviors = behaviors
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.isHidden = true
            applyBehaviors { $0.afterLoading($1) }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            applyBehaviors { $0.beforeAppearing($1) }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            applyBehaviors { $0.afterAppearing($1) }
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            applyBehaviors { $0.beforeDisappearing($1) }
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            applyBehaviors { $0.afterDisappearing($1) }
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            applyBehaviors { $0.beforeLayingOutSubviews($1) }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            applyBehaviors { $0.afterLayingOutSubviews($1) }
        }
        
        private func applyBehaviors(
            handler: (_ behavior: ViewControllerLifeCycleBehavior, _ viewController: UIViewController) -> Void
        ) {
            guard let parentViewController = parent else { return }
            behaviors.forEach { handler($0, parentViewController) }
        }
        
    }

    func addBehaviors(_ behaviors: [ViewControllerLifeCycleBehavior]) {
        let behaviorVC = LifeCycleBehaviorViewController(behaviors: behaviors)
        addChild(behaviorVC)
        view.addSubview(behaviorVC.view)
        behaviorVC.didMove(toParent: self)
    }
    
}
