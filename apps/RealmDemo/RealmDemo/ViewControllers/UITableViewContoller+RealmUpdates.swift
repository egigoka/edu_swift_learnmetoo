//
//  UITableViewContoller+RealmUpdates.swift
//  RealmDemo
//
//  Created by egigoka on 14.09.2025.
//

import UIKit
import RealmSwift

extension UITableViewController {
    
    func updateTableView<T: Object>(with changes: RealmCollectionChange<Results<T>>, inSection section: Int) {
        
        switch changes {
        case .initial:
            tableView.reloadData()
        case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
            print("performing update on section: \(section) with \(insertions.count) insertions, \(modifications.count) modifications, and \(deletions.count) deletions") // debug
            tableView.performBatchUpdates {
                tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: section)}, with: .automatic)
                tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: section) }, with: .automatic)
                tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: section)}, with: .automatic)
            }
        case .error(let error):
            fatalError("Realm notifications error: \(error)")
        }
    }
    
}
