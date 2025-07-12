//
//  CoursesViewController.swift
//  Networking
//
//  Created by egigoka on 12.07.2025.
//

import UIKit

class CoursesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
