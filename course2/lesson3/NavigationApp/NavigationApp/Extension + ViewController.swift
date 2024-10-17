//
//  Extension + ViewController.swift
//  NavigationApp
//
//  Created by Alexey Efimov on 25.05.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

extension UserListViewController: UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: user)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
