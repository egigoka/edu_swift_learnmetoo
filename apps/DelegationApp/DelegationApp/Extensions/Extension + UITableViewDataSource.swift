//
//  Extension + UITableViewDataSource.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 13.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

extension ContactListViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

// MARK: - UITAbleViewDataSource
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
}
