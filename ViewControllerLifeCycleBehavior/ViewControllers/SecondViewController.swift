//
//  SecondViewController.swift
//  ViewControllerLifeCycleBehavior
//
//  Created by Yury Buslovsky on 14.05.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

// MARK: - Declaration

final class SecondViewController: BehaviorContainingVC<PrimaryNavBar_EdgesForExtendedLayout> {

    @IBAction private func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Table View Data Source and Delegate

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 20 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        return cell
    }

}
